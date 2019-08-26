//
//  RotinaViewController.swift
//  Catarina
//
//  Created by Mariana Beilune Abad on 16/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit
//import Firebase



class RotinaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    
    
    
    var tableViewData = [Periodo]()
    

    @IBOutlet weak var tableView: UITableView!
    var cont = 0
    
    @IBAction func addButton(_ sender: Any) {
    
        let addOverPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addPopUpID") as! AddPopUpViewController
        if(!Singleton.instance.popUpAberto){
            Singleton.instance.popUpAberto = true
            self.addChild(addOverPopUp)
            addOverPopUp.view.frame = self.view.frame
            self.view.addSubview(addOverPopUp.view)
            addOverPopUp.didMove(toParent: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        Singleton.instance.adiconarTarefas(titulo: "Manhã1", descricao: "Dar de comer", periodo: "Manhã", aberto: false, concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Tarde1", descricao: "Dar de banho", periodo: "Tarde", aberto: false, concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Noite1", descricao: "Dar de banho", periodo: "Tarde", aberto: false, concluido: false)
        var listaPeriodo = [Periodo.init(nTitulo: "Manhã", tarefas: Singleton.instance.listaTarefas,nAberto: false),Periodo.init(nTitulo: "Tarde", tarefas: Singleton.instance.listaTarefas,nAberto: false),Periodo.init(nTitulo: "Noite", tarefas: Singleton.instance.listaTarefas,nAberto: false)]
        tableViewData = listaPeriodo
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].aberto ==  false{
            return tableViewData.count
        }
        else {
            return tableViewData[section].quantidadeTarefas
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellPrincipalViewTableViewCell
            cell.lblTitulo.text = tableViewData[indexPath.section].titulo
            //cell.lblDate.text = tableViewData[indexPath.section].periodo
            //if tableViewData[indexPath.section].concluido{cell.lblConcluido.text = "Tarefa concluida"}
            //else{cell.lblConcluido.text = "Tarefa não concluida"}
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellInfo", for: indexPath) as! CellInfoTableViewCell
            cell.LabelTest.text = tableViewData[indexPath.section].vetorTarefas[cont].titulo
            return cell
        }
        cont+=1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableViewData[indexPath.section].aberto == true{
                print("ta aberto")
                tableViewData[indexPath.section].aberto = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none )//anim
                
            }
            else {
                print("ta fechado")
                tableViewData[indexPath.section].aberto  = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)//anim
            }
        }
    }
    

}
