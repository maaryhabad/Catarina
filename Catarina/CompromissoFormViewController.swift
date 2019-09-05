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
        
            <<< ActionSheetRow<String>(){
                $0.title = "AcionSheetRow"
                $0.options = ["Contatos"]
                
            }
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
