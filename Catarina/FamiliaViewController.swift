//
//  FamiliaViewController.swift
//  Catarina
//
//  Created by Pyettra Ferreira on 28/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class FamiliaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
<<<<<<< Updated upstream
    
    var tableViewData = [Familia]()
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func addFamiliar(_ sender: Any) {
        let addOverPopUp = UIStoryboard(name: "Familia", bundle: nil).instantiateViewController(withIdentifier: "addPopUpID") as! FamiliaFormPopUpViewController
        if(!FamiliaSingleton.instance.popUpAberto) {
            FamiliaSingleton.instance.popUpAberto = true
            self.addFamiliar(addOverPopUp)
=======

    @IBOutlet weak var tableView: UITableView!
    var tableViewData = [Familia]()

    @IBAction func addFamiliar(_ sender: Any) {
        let addOverPopUp = UIStoryboard(name: "Familia", bundle: nil).instantiateViewController(withIdentifier: "addPopUpId") as! FamiliaFormPopUpViewController
        if(!FamiliaSingleton.instance.popUpAberto) {
            FamiliaSingleton.instance.popUpAberto = true
            self.addChild(addOverPopUp)
>>>>>>> Stashed changes
            addOverPopUp.view.frame = self.view.frame
            self.view.addSubview(addOverPopUp.view)
            addOverPopUp.didMove(toParent: self)
        }
<<<<<<< Updated upstream
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        FamiliaSingleton.instance.adicionarFamiliar(nome: "Mamae", avatar: UIImage(named: "teste")!)
        FamiliaSingleton.instance.adicionarFamiliar(nome: "Pai", avatar: UIImage(named: "ssdklmsd")!)
        
        
=======
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        FamiliaSingleton.instance.adicionarFamiliar(nome: "Mae", avatar: UIImage(named: "playlist")!)
        FamiliaSingleton.instance.adicionarFamiliar(nome: "Pai", avatar: UIImage(named: "playlist")!)
    
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        let cell = tableview.dequeueReusableCell(withIdentifier: "familiaCell", for: indexPath) as! FamiliaViewCell
        
        let familiar = tableViewData[indexPath.row]
        
        cell.nomeFamiliar.text = familiar.nome
        cell.avatar.image = familiar.avatar
        
=======
        let cell = tableView.dequeueReusableCell(withIdentifier: "familiaCell", for: indexPath) as! FamiliaInfoCell
        cell.nomeLbl.text = tableViewData[indexPath.row].nome
        cell.avatarImg.image = tableViewData[indexPath.row].avatar
>>>>>>> Stashed changes
        return cell
    }
    
    
<<<<<<< Updated upstream
    
=======
>>>>>>> Stashed changes
}
