//
//  CompromissoViewController.swift
//  Catarina
//
//  Created by Pyettra Ferreira on 02/09/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Eureka

class CompromissoViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Novo Compromisso")
        
            <<< TextRow() {
                $0.title = "Compromisso"
        }
            <<< TextRow() {
                
                $0.title = "Responsável"
        }
            <<< DatePickerRow() {
                $0.title = "Horário"
        }
    }
}
