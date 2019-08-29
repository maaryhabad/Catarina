//
//  Compartilhar.swift
//  Catarina
//
//  Created by Mariana Beilune Abad on 28/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import UIKit

func mandarMensagem() {
    
    var texto = "Olá\nVocê recebeu uma tarefa!"
    
    let urlWhats = "whatsapp://send?text=\(texto)"
    if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
        if let whatsappURL = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(whatsappURL) {
                UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
            }
        } else {
            print("Instale o Whatsapp")
        }
    }
}
