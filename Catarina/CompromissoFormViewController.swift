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


class CompromissoFormViewController: FormViewController, CNContactPickerDelegate {
    
    var selectedContat: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagem = UIImage(named: "navBar.png")
        self.navigationController?.navigationBar.setBackgroundImage(imagem, for: .default)
        
        form +++ Section()
            <<< TextRow("titulo") {
                $0.title = "Compromisso"
            }
            <<< DateInlineRow("data") {
                $0.title = "Data"
            }
            <<< TimeInlineRow("horario") {
                $0.title = "Horario"
            }
            <<< TextRow("local") {
                $0.title = "Local"
            }
            <<< SwitchRow("lembrar") {
                $0.title = "Notificação"
            }
            
            <<< ButtonRow(){
                $0.title = "Contatos"
                $0.onCellSelection(self.contato)
            }
            <<< LabelRow("contatoName") {
                $0.title = ""
                $0.hidden = true
            }
        
        <<<
            ButtonRow("salvar") {
                $0.title = "Salvar"
                $0.onCellSelection(self.save)
        }
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
        
        print(titulo)
        print(notificacao)
        print(local)
        print(responsavel)
        print(periodo)
        print(components)
        
        Singleton.instance.adiconarCompromisso(titulo: titulo, responsavel: responsavel, data: components, periodo: periodo, local: local, lembrar: notificacao)

    }
}


