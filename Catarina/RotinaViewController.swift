//
//  RotinaViewController.swift
//  Catarina
//
//  Created by Mariana Beilune Abad on 16/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class RotinaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    var tableViewData = [Periodo]()
    
    @IBOutlet weak var tableView: UITableView!
    
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
        Singleton.instance.adiconarTarefas(titulo: "Acordar", descricao: "Acordar a crianca", periodo: "Manhã", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Amamentar", descricao: "Botar pra mamar", periodo: "Manhã", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Fazer coco", descricao: "Cagar na crianca", periodo: "Manhã", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Passear", descricao: "Sair pra passear", periodo: "Tarde", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Brincar", descricao: "Sair pra brincar", periodo: "Tarde", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Tomar sol", descricao: "Torrar a criança no sol", periodo: "Tarde", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Chorar", descricao: "Arrebentar a crianca pra ela chorar", periodo: "Noite", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Comer", descricao: "Socar comida na crianca", periodo: "Noite", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Dormir", descricao: "Botar pra dormir", periodo: "Noite", concluido: false)
        Singleton.instance.adiconarCompromisso(titulo: "CompromissoTeste", local: "LocalTeste", observacao: "ObservacaoTeste", lembrar: false, periodo: "Manhã")
        
        let listaPeriodo = Singleton.instance.listaPeriodo
        tableViewData = listaPeriodo
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].aberto ==  true {
            return tableViewData[section].vetorTarefas.count + 1
        }
        else {
            return 1//tableViewData[section].vetorTarefas.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellPrincipalViewTableViewCell
            cell.lblTitulo.text = tableViewData[indexPath.section].titulo
            //cell.lblDate.text = tableViewData[indexPath.section].periodo
            //if tableViewData[indexPath.section].concluido{cell.lblConcluido.text = "Tarefa concluida"}
            //else{cell.lblConcluido.text = "Tarefa não concluida"}
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellInfo", for: indexPath) as! CellInfoTableViewCell
            
            cell.LabelTest.text = tableViewData[indexPath.section].vetorTarefas[indexPath.row-1].titulo
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].aberto == true{
                //print("ta aberto")
                tableViewData[indexPath.section].aberto = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none )//anim
                
            }
            else {
                //print("ta fechado")
                tableViewData[indexPath.section].aberto  = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)//anim
            }
        }
        else {
            let addOverPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpDescription") as! PopUpDescriptionViewController
            if(!Singleton.instance.popUpDescricaoAberto){
                Singleton.instance.popUpDescricaoAberto = true
                self.addChild(addOverPopUp)
                addOverPopUp.view.frame = self.view.frame
                addOverPopUp.lblTtitulo.text = self.tableViewData[indexPath.section].vetorTarefas[indexPath.row-1].titulo
                addOverPopUp.lblDescricao.text = self.tableViewData[indexPath.section].vetorTarefas[indexPath.row-1].descricao
                addOverPopUp.lblConcluido.text = "Tarefa conlcuida"
                if(!self.tableViewData[indexPath.section].vetorTarefas[indexPath.row-1].concluido){
                    addOverPopUp.lblConcluido.text = "Tarefa não conlcuida"
                }
                self.view.addSubview(addOverPopUp.view)
                addOverPopUp.didMove(toParent: self)
            }
        }
    }
}
