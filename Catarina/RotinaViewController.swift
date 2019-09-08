import UIKit

class RotinaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    var tableViewData = [Periodo]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewData = [Dia]()
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        var date = DateComponents()
        collectionViewData = Singleton.instance.listaDia
        tableViewData = Singleton.instance.listaDia[0].listaPeriodo
        
        let imagem = UIImage(named: "navBar.png")
        self.navigationController?.navigationBar.setBackgroundImage(imagem, for: .default)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDias", for: indexPath) as! CellCollectionDays
        cell.numDia.text = "\(((collectionViewData[indexPath.row].data.day) as! Int))"
        let dateDate = Calendar(identifier: .gregorian).date(from: collectionViewData[indexPath.row].data)!
        let numDia  =  Calendar.current.component(.weekday, from: dateDate)
        switch numDia {
        case 1:
            cell.strDia.text = "Dom"
            
        case 2:
            cell.strDia.text = "Seg"
        case 3:
            cell.strDia.text = "Ter"
        case 4:
            cell.strDia.text = "Qua"
        case 5:
            cell.strDia.text = "Qui"
        case 6:
            cell.strDia.text = "Sex"
        case 7:
            cell.strDia.text = "Sab"
        default:
            ""
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Singleton.instance.diaSelecionado = indexPath.row
        tableViewData = collectionViewData[indexPath.row].listaPeriodo
        tableView.reloadData()
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
