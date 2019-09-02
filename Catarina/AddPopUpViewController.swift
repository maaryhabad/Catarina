//
//  AddPopUpViewController.swift
//  Catarina
//
//  Created by akira tsukamoto on 19/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class AddPopUpViewController: UIViewController {
    
    
    @IBOutlet weak var btnAddCompromisso: UIButton!
    @IBOutlet weak var btnAddTarefa: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.showAnimate()
    }
    
    @IBOutlet weak var blurView: UIView!
    @IBAction func closePopUp(_ sender: Any) {
        Singleton.instance.popUpAberto = false
        self.removeAnimate()
    }
    
    @IBAction func addTarefa(_ sender: Any) {
        
    }
    
    @IBAction func addCompromisso(_ sender: Any) {
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
