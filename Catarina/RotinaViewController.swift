import UIKit

class RotinaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    var tableViewData = [Periodo]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        Singleton.instance.adiconarTarefas(titulo: "Acordar", descricao: "Acordar a crianca", periodo: "Manhã", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Amamentar", descricao: "Botar pra mamar", periodo: "Manhã", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Fazer coco", descricao: "Cagar na crianca", periodo: "Manhã", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Passear", descricao: "Sair pra passear", periodo: "Tarde", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Brincar", descricao: "Sair pra brincar", periodo: "Tarde", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Tomar sol", descricao: "Torrar a criança no sol", periodo: "Tarde", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Chorar", descricao: "Arrebentar a crianca pra ela chorar", periodo: "Noite", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Comer", descricao: "Socar comida na crianca", periodo: "Noite", concluido: false)
        Singleton.instance.adiconarTarefas(titulo: "Dormir", descricao: "Botar pra dormir", periodo: "Noite", concluido: false)
        Singleton.instance.adiconarCompromisso(titulo: "Vacina", descricao: "Dar Vacina", periodo: "Tarde", concluido: false, lembrar: true, local: "Av getulio varguinhas")
        let listaPeriodo = Singleton.instance.listaDia[0].listaPeriodo
        tableViewData = listaPeriodo
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDias", for: indexPath) as! CellCollectionDays
            cell.image.image = UIImage(named: "test")
            return cell
        
    }
    
    
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
        // FECHADOOOOOOOOOOO Manha | Tarde | Noite
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellPrincipalViewTableViewCell
            cell.lblTitulo.text = tableViewData[indexPath.section].titulo
            return cell
        }
        else {
            // ABERTOOOOOOOOO Lista de tarefas e compromissos
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellInfo", for: indexPath) as! CellInfoTableViewCell
            
            if (tableViewData[indexPath.section].vetorTarefas[indexPath.row-1].isTarefa){
                cell.LabelTest.text = tableViewData[indexPath.section].vetorTarefas[indexPath.row-1].titulo
            }
            else{
                cell.LabelTest.text = "*"+tableViewData[indexPath.section].vetorTarefas[indexPath.row-1].titulo
            }
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
                
                if !self.tableViewData[indexPath.section].vetorTarefas[indexPath.row-1].isTarefa{
                    addOverPopUp.lblHora.isHidden = false
                    addOverPopUp.lblHora.text = "Algum horário"
                    addOverPopUp.lblLocal.isHidden = false
                    addOverPopUp.lblLocal.text = "Algum Local"
                }
                
                
                self.view.addSubview(addOverPopUp.view)
                addOverPopUp.didMove(toParent: self)
            }
        }
    }
    
}
