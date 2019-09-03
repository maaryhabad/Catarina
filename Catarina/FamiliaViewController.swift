//
//  FamiliaViewController.swift
//  Catarina
//
//  Created by Pyettra Ferreira on 28/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class FamiliaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    var tableViewData = [Familia]()
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func addFamiliar(_ sender: Any) {
        let addOverPopUp = UIStoryboard(name: "Familia", bundle: nil).instantiateViewController(withIdentifier: "addPopUpID") as! FamiliaFormPopUpViewController
        if(!FamiliaSingleton.instance.popUpAberto) {
            FamiliaSingleton.instance.popUpAberto = true
            self.addFamiliar(addOverPopUp)
            addOverPopUp.view.frame = self.view.frame
            self.view.addSubview(addOverPopUp.view)
            addOverPopUp.didMove(toParent: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        FamiliaSingleton.instance.adicionarFamiliar(nome: "Mamae", avatar: UIImage(named: "teste")!)
        FamiliaSingleton.instance.adicionarFamiliar(nome: "Pai", avatar: UIImage(named: "ssdklmsd")!)
        
        
        let nucleoFamiliar = FamiliaSingleton.instance.nucleoFamiliar
        tableViewData = nucleoFamiliar
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "familiaCell", for: indexPath) as! FamiliaViewCell
        
        let familiar = tableViewData[indexPath.row]
        
        cell.nomeFamiliar.text = familiar.nome
        cell.avatar.image = familiar.avatar
        
        return cell
    }
    
    
    
}
