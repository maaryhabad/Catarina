//
//  RotinaViewController.swift
//  Catarina
//
//  Created by Mariana Beilune Abad on 16/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
import SpriteKit


struct cellData {
    var aberto = Bool()
    var titulo = String()
    var secundaryInfo = CellInfoTableViewCell()
}


class RotinaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    var tableViewData = [Tarefa]()
    

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func addButton(_ sender: Any) {
        
        let addOverPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addPopUpID") as! AddPopUpViewController
        self.addChild(addOverPopUp)
       addOverPopUp.view.frame = self.view.frame
        self.view.addSubview(addOverPopUp.view)
        addOverPopUp.didMove(toParent: self)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableViewData = [Tarefa.init(nTitulo: "Titulo1", nDescricao: "Descricao", nlabelTeste: "valorSecundario", nCamimhoImage: "teste.png", nAberto: false),
        Tarefa.init(nTitulo: "Titulo2", nDescricao: "Descricao", nlabelTeste: "valorSecundario", nCamimhoImage: "teste.png", nAberto: false)]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].aberto ==  false{
            return 1
        }
        else {
            return tableViewData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else{ return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].titulo
            //cell.textLabel?.text = tableViewData[indexPath.section].descricao
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellInfo") else {return UITableViewCell() as! CellInfoTableViewCell}
           // cell.textLabel?.text = tableViewData[indexPath.section].camimhoImage
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableViewData[indexPath.section].aberto == true{
                tableViewData[indexPath.section].aberto = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none )//anim
                
            }else{
                tableViewData[indexPath.section].aberto  = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)//anim
            }
        }
    }
    

}
