//
//  PopUpDescriptionViewController.swift
//  Catarina
//
//  Created by akira tsukamoto on 28/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class PopUpDescriptionViewController: UIViewController {

    
    @IBOutlet weak var lblTtitulo: UILabel!
    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var lblConcluido: UILabel!
    
    
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            self.showAnimate()
            
        }
    
       
    @IBAction func closePopUp(_ sender: Any) {
        Singleton.instance.popUpDescricaoAberto = false
        self.removeAnimate()
    }
    
        func showAnimate(){
            self.view.transform = CGAffineTransform.init(scaleX: 2.0 , y: 2.0)
            self.view.alpha = 0.0
            UIView.animate(withDuration: 0.4, animations: {
                self.view.alpha = 1.0
                self.view.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
                //print(<#T##items: Any...##Any#>)
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
