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
        static let avatar = "avatar"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.showAnimate()
        
        
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
        
        let dict = form.values()
        
    }
    
//    @IBAction func save(_ sender: Any) {
//        for index in nucleoFamiliar {
//            nucleoFamiliar
//        }
//    }
    
    
    func showAnimate() {
        self.view.transform = CGAffineTransform.init(scaleX: 2.0 , y: 2.0)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.4, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        },completion: {(finished:Bool) in
            if(finished){
                self.view.removeFromSuperview()
            }
        })
    }
}
