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
            <<< PickerRow<String>() {
                (row: PickerRow<String>) -> Void in
                row.options = ["Banho", "Amamentação", "Sono", "Alimentação", "Estímulo", "Outro"]
                row.title = "Tarefa"
                }
            <<< SegmentedRow<String>() {
                $0.title = "Período"
                $0.options = ["Manhã", "Tarde", "Noite"]
            }
            <<< TextRow() {
                $0.title = "Nome"
                $0.placeholder = "Nome do responsável"
        }
        
    }
}
