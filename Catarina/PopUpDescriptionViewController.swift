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
    @IBOutlet weak var lblLocal: UILabel!
    @IBOutlet weak var lblHora: UILabel!
    
//    @IBOutlet weak var lblLocal: UILabel!
//    @IBOutlet weak var lblHora: UILabel!
//    @IBOutlet weak var viewMid: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.showAnimate()
        
        let imagem = UIImage(named: "navBar.png")
        self.navigationController?.navigationBar.setBackgroundImage(imagem, for: .default)
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch: UITouch? = touches.first
//        //location is relative to the current view
//        // do something with the touched point
//        if touch?.view != viewMid {
//            Singleton.instance.popUpDescricaoAberto = false
//            self.removeAnimate()
//        }
//    }
    
    
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
