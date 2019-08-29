//
//  FamiliaSingleton.swift
//  Catarina
//
//  Created by Pyettra Ferreira on 28/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UIKit

class FamiliaSingleton {
    
    static let instance = FamiliaSingleton()
    var popUpAberto = false
    private init() {}
    var nucleoFamiliar: [Familia] = []
    var userid: String!
    
    func adicionarFamiliar(nome: String, avatar: UIImage) {
        let familiar = Familia.init(nome: nome, avatar: avatar)
<<<<<<< Updated upstream
        
=======
>>>>>>> Stashed changes
        nucleoFamiliar.append(familiar)
    }
}
