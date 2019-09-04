//
//  CompromissoViewController.swift
//  Catarina
//
//  Created by Pyettra Ferreira on 02/09/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Eureka

class CompromissoFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Novo Compromisso")
        
            <<< TextRow("titulo") {
                $0.title = "Compromisso"
        }
            <<< TextRow("responsavel") {
                
                $0.title = "Responsável"
        }
            <<< DatePickerRow("data") {
                $0.title = "Horário"
        }
            <<< TextRow("local") {
                $0.title = "Local"
        }
            <<< SwitchRow("lembrar") {
                $0.title = "Notificação"
        }
    }

    
    func save() -> Compromisso{
        let formValues = form.values()
        
        let titulo = formValues["titulo"] as? String
        let responsavel = formValues["responsavel"] as? String
        let data = formValues["data"] as? Date
        let local = formValues["local"] as? String
        let notificacao = formValues["lembrar"] as? Bool
        
        let compromisso = Compromisso(nTitulo: titulo!, nLocal: local!, nObservacao: "", nLembrar: notificacao!, nPeriodo: data!, responsavel: responsavel!)
        
        return compromisso
        
    }
}
