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
    @IBOutlet weak var contactBtn: UIButton!
    @IBOutlet weak var lbl: UITextField!
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        save()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section()
            <<< TextRow("titulo") {
                $0.title = "Compromisso"
            }
            +++ Section()
            <<< TextRow("responsavel") {
                $0.title = "Responsável"
            }
            +++ Section()
            <<< DateInlineRow("data") {
                $0.title = "Data"
            }
            <<< TimeInlineRow("horario") {
                $0.title = "Horario"
            }
            +++ Section()
            <<< TextRow("local") {
                $0.title = "Local"
            }
            +++ Section()
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
//                $0.hidden = Condition.function(["contatoName"], { (form) -> Bool in
//                    return !((form.rowBy(tag: "contatoName") as? LabelRow)?.title == nil ? true : false)
//                })
                //                $0.cellUpdate({ (textCell, textRow) in
                //                    textRow.title = self.selectedContat
                //                    textRow.hidden = self.selectedContat != nil ? false : true
                //
                //                })
//                $0.cellUpdate({ (cell, row) in
//                    row.hidden = false
//                })
            }
    }

    func contato(cell: ButtonCellOf<String>, row: ButtonRow) {
        let contactVc = CNContactPickerViewController()
        contactVc.delegate = self
        self.present(contactVc, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        print(contact.phoneNumbers)
        
        // let numbers = contact.phoneNumbers.first
        selectedContat = contact.givenName
        self.form.rowBy(tag: "contatoName")?.title = selectedContat
        self.form.rowBy(tag: "contatoName")?.hidden = false
        self.form.rowBy(tag: "contatoName")?.evaluateHidden()
        // self.form.rowBy(tag: "contatoName")?.hidden = false
        self.form.rowBy(tag: "contatoName")?.updateCell()
        
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func save() {
        let formValues = form.values()
        
        let titulo = formValues["titulo"] as? String
        let responsavel = formValues["responsavel"] as? String
        let data = formValues["data"] as? Date
        let horario = formValues["horario"] as? Date
        let local = formValues["local"] as? String
        let notificacao = formValues["lembrar"] as? Bool
        
        let compromisso = Compromisso(nTitulo: titulo!, nLocal: local!, nObservacao: "", nLembrar: notificacao!, nPeriodo: data!, responsavel: responsavel!)
        
        Singleton.instance.adiconarCompromisso(titulo: titulo!, lembrar: notificacao!, local: local!, responsavel: responsavel!, data: data!)
    }
}
