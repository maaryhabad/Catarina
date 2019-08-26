//
//  FamiliaFormPopUpViewController.swift
//  Catarina
//
//  Created by Pyettra Ferreira on 26/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import Eureka

class FamiliaFormPopUpViewController: FormViewController {
    
    struct FormItems {
        static let nome = "nome"
        static let avatar = "avatar"
        static let contato = "contato"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Adicionar responsável")
            <<< TextRow(FormItems.nome) { row in
                row.title = "Nome"
                row.placeholder = "Nome do responsável"
        }
//            <<< PickerInlineRow(FormItems.avatar) { row in
//                row.title = "Avatar"
//
//
//        }
        
    }
}
