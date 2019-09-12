import Eureka
import ContactsUI

class TarefaFormViewController: FormViewController, CNContactPickerDelegate {
   
    var selectedContact: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagem = UIImage(named: "navBar.png")
        self.navigationController?.navigationBar.setBackgroundImage(imagem, for: .default)
        
        
        form +++ Section()
            <<< PickerInlineRow<String>("titulo") {
                (row: PickerInlineRow<String>) -> Void in
                row.options = ["Banho", "Amamentação", "Sono", "Alimentação", "Estímulo"]
                row.title = "Tarefa"
                row.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                row.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
                
            }
            <<< SegmentedRow<String>("periodo") {
                $0.options = ["Manhã", "Tarde", "Noite"]
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
        }.cellUpdate {
                cell, row in
                cell.textLabel?.textColor = UIColor.blue
            }
            
            <<< MultipleSelectorRow<String>("repete") {
                $0.title = "Repetir"
                $0.options = [
                    "Toda segunda-feira",
                    "Toda terça-feira",
                    "Toda quarta-feira",
                    "Toda quinta-feira",
                    "Toda sexta-feira",
                    "Todo sábado",
                    "Todo domingo"
                ]
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
            }
            <<< ButtonRow("responsavel") {
                $0.title = "Contatos"
                $0.onCellSelection(self.contato)
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
        }.cellUpdate {
                cell, row in
                cell.textLabel?.textColor = UIColor.blue
            }
            
            <<< LabelRow("contatoName") {
                $0.title = ""
                $0.hidden = true
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
            }
            <<< SwitchRow("lembrar") {
                $0.title = "Lembrar"
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
        }
        
            <<< ButtonRow("salvar") {
                $0.title = "Salvar"
                $0.onCellSelection(self.save)
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
        }.cellUpdate {
            cell, row in
            cell.textLabel?.textColor = UIColor.blue
        }
         self.tableView.separatorStyle = .none
    }
    
    func contato(cell: ButtonCellOf<String>, row: ButtonRow) {
        let contatoVc = CNContactPickerViewController()
        contatoVc.delegate = self
        self.present(contatoVc, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        selectedContact = contact.givenName
        self.form.rowBy(tag: "contatoName")?.title = contact.givenName
        self.form.rowBy(tag: "contatoName")?.hidden = false
        self.form.rowBy(tag: "contatoName")?.evaluateHidden()
        self.form.rowBy(tag: "contatoName")?.updateCell()
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        self.dismiss(animated: true, completion: nil)
    }

    
    func save(cell: ButtonCellOf<String>, row: ButtonRow) {
        let formValues = form.values()
        var dias: [Bool] = [Bool](repeating: false, count: 7)
        print(formValues)
        print(selectedContact)
        
        var titulo = formValues["titulo"] as? String
        var periodo = formValues["periodo"] as? String
        var responsavel = selectedContact as? String
        var lembrar = formValues["lembrar"] as? Bool
        if(titulo == nil){
            titulo = "Tarefa sem titulo"
        }
        if(periodo == nil){
            periodo = "Manhã"
        }
        if(responsavel == nil){
            responsavel = "Mãe"
        }
        if(lembrar == nil){
            lembrar = false
        }
        if var repete = formValues["repete"] as? Set<String> {
            if(repete == nil){
                repete = ["Toda segunda-feira"]
            }
            for i in repete {
                //print(i)
                if i == "Toda segunda-feira" {
                    dias[0] = true
                }
                if i == "Toda terça-feira" {
                    dias[1] = true
                }
                if i == "Toda quarta-feira" {
                    dias[2] = true
                }
                if i == "Toda quinta-feira" {
                    dias[3] = true
                }
                if i == "Toda sexta-feira" {
                    dias[4] = true
                }
                if i == "Todo sábado" {
                    dias[5] = true
                }
                if i == "Todo domingo" {
                    dias[6] = true
                }
            }
        }
        
        Singleton.instance.adiconarTarefas(titulo: titulo!, periodo: periodo!, nResponsavel: responsavel!, segunda: dias[0], terca: dias[1], quarta: dias[2], quinta: dias[3], sexta: dias[4], sabado: dias[5], domingo: dias[6])
        
        }
}


