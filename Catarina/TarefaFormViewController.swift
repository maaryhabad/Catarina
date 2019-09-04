//
//  TarefaFormViewController.swift
//  Catarina
//
//  Created by Pyettra Ferreira on 02/09/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Eureka

class TarefaFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Nova Tarefa")
            <<< PickerRow<String>("titulo") {
                (row: PickerRow<String>) -> Void in
                row.options = ["Banho", "Amamentação", "Sono", "Alimentação", "Estímulo", "Outro"]
                row.title = "Tarefa"
                }
            
            <<< SegmentedRow<String>("periodo") {
                $0.title = "Período"
                $0.options = ["Manhã", "Tarde", "Noite"]
            }
            
            <<< TextRow("responsavel") {
                $0.title = "Responsável"
        }
        
    }
    
    func save() -> Tarefa {
        let formValues = form.values()
        
        let titulo = formValues["titulo"] as? String
        let periodo = formValues["periodo"] as? String
        let responsavel = formValues["responsavel"] as? String
        
        let tarefa = Tarefa(nTitulo: titulo!, nDescription: "", nPeriodo: periodo!, nLembrar: false, nLocal: "", nIsTarefa: true, responsavel: responsavel!)
        
        return tarefa
        
        // colocar a funçao de compartilhamento aqui!!!
        
    }
}
