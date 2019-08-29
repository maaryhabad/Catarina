//
//  FamiliaFormPopUpViewController.swift
//  Catarina
//
//  Created by Pyettra Ferreira on 26/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import Eureka
import ImageRow

class FamiliaFormPopUpViewController: FormViewController {
    
    struct FormItems {
        static let nome = "nome"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Adicionar responsável")
            <<< TextRow(FormItems.nome) { row in
                row.title = "Nome"
                row.placeholder = "Nome do responsável"
        }
            <<< ImageRow() { row in
                row.title = "Imagem"
                row.sourceTypes = .PhotoLibrary
                row.clearAction = .no
                
        }
                .cellUpdate {
                    cell, row in
                    cell.accessoryView?.layer.cornerRadius = 17
                    cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        }
        
    }
}
