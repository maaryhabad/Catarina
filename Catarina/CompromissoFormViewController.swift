//
//  CompromissoViewController.swift
//  Catarina
//
//  Created by Pyettra Ferreira on 02/09/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Eureka
import UIKit
import ContactsUI


extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var hexInt: UInt32 = 0
        let scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt32(&hexInt)
        
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        let alpha = alpha
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

class CompromissoFormViewController: FormViewController, CNContactPickerDelegate {
    
    var selectedContat: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagem = UIImage(named: "navBar.png")
        self.navigationController?.navigationBar.setBackgroundImage(imagem, for: .default)
        
        form +++ Section()
            <<< TextRow("titulo") {
                $0.title = "Compromisso"
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
            }
            <<< DateInlineRow("data") {
                $0.title = "Data"
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
            }
            <<< TimeInlineRow("horario") {
                $0.title = "Horario"
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
            }
            <<< TextRow("local") {
                $0.title = "Local"
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
            }
            <<< SwitchRow("lembrar") {
                $0.title = "Lembrar"
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
            }
            
            <<< ButtonRow(){
                $0.title = "Contatos"
                $0.onCellSelection(self.contato)
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
                }.cellUpdate {
                    cell, row in
                    cell.textLabel?.textColor = UIColor.blue
            }
            <<< LabelRow("contatoName") {
                $0.title = ""
                $0.hidden = true
             $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
            }
        
        <<<
            ButtonRow("salvar") {
                $0.title = "Salvar"
                $0.onCellSelection(self.save)
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
                }.cellUpdate {
                    cell, row in
                    cell.textLabel?.textColor = UIColor.blue
        }
        
        self.tableView.separatorStyle = .none
    }

    func contato(cell: ButtonCellOf<String>, row: ButtonRow) {
        let contactVc = CNContactPickerViewController()
        contactVc.delegate = self
        self.present(contactVc, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
 
        selectedContat = contact.givenName
        self.form.rowBy(tag: "contatoName")?.title = contact.givenName
        self.form.rowBy(tag: "contatoName")?.hidden = false
        self.form.rowBy(tag: "contatoName")?.evaluateHidden()
        self.form.rowBy(tag: "contatoName")?.updateCell()
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func save(cell: ButtonCellOf<String>, row: ButtonRow) {
        
        let calendar = Calendar.current
        let now = Date()
        
        var periodo = String("")
        
        var primeiroHorario = calendar.date(bySettingHour: 5, minute: 0, second: 0, of: now) as! Date
        var segundoHorario = calendar.date(bySettingHour: 12, minute: 0, second: 0, of: now) as! Date
        var terceiroHorario = calendar.date(bySettingHour: 18, minute: 0, second: 0, of: now) as! Date
        
        let formValues = form.values()
        
        let titulo = formValues["titulo"] as! String
        let responsavel = selectedContat as! String
        let data = formValues["data"] as! Date
        let horario = formValues["horario"] as! Date//alterar para periodo
        let local = formValues["local"] as! String
        let notificacao = formValues["lembrar"] as! Bool
        
        let components = calendar.dateComponents([.day, .month, .year], from: data)
        
        if (horario >= primeiroHorario && horario < segundoHorario) {
            periodo = "Manhã"
        } else if (horario >= segundoHorario && horario < terceiroHorario) {
            periodo = "Tarde"
        } else {
            periodo = "Noite"
        }
        Singleton.instance.adiconarCompromisso(titulo: titulo, responsavel: responsavel, data: components, periodo: periodo, local: local, lembrar: notificacao)

    }
}


