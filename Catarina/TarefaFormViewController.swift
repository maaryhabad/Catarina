import Eureka
import ContactsUI

class TarefaFormViewController: FormViewController, CNContactPickerDelegate {
   
    var selectedContact: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagem = UIImage(named: "navBar.png")
        self.navigationController?.navigationBar.setBackgroundImage(imagem, for: .default)
        
        
        form +++ Section()
            <<< PickerInlineRow<String>("titulo") {
                (row: PickerInlineRow<String>) -> Void in
                row.options = ["Banho", "Amamentação", "Sono", "Alimentação", "Estímulo", "Outro"]
                row.title = "Tarefa"
                if (row.value == "Outro") {
                    // open another text row. maybe by calling a function that creates this row?
                }
                row.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                row.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
                
            }
            <<< SegmentedRow<String>("periodo") {
                $0.options = ["Manhã", "Tarde", "Noite"]
                $0.cell.backgroundColor = UIColor(hexString: "F2F1F6")
                $0.cell.textLabel?.font = UIFont(name: "Avenir Next", size: 17)
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
        
        let titulo = formValues["titulo"] as! String
        let periodo = formValues["periodo"] as! String
        let responsavel = selectedContact as! String
        let lembrar = formValues["lembrar"] as! Bool
        if let repete = formValues["repete"] as? Set<String> {
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
        
        Singleton.instance.adiconarTarefas(titulo: titulo, periodo: periodo, nResponsavel: responsavel, segunda: dias[0], terca: dias[1], quarta: dias[2], quinta: dias[3], sexta: dias[4], sabado: dias[5], domingo: dias[6])
        
        }
}


//        let titulo = formValues["titulo"]
//        let responsavel = (self.form.values()["contatoName"]!! as! [String?]).compactMap { $0 }
//        let periodo = (self.form.values()["periodo"]!! as! [String?]).compactMap { $0 }
//
//        var dias: [Bool] = [Bool](repeating: false, count: 7)
// let responsavel = form.rowBy(tag: "contatoName")?.title ?? ""
// let titulo = form.rowBy(tag: "titulo")?.title as? String

//var titulo = (formValues["titulo"] as? String)
// var periodo: String = (formValues["periodo"] as? String)
//        var lembrar = formValues["lembrar"] as? Bool
//        if let repete = formValues["repete"] as? Set<String> {
//            for i in repete {
//                //print(i)
//                if i == "Toda segunda-feira" {
//                    dias[0] = true
//                }
//                if i == "Toda terça-feira" {
//                    dias[1] = true
//                }
//                if i == "Toda quarta-feira" {
//                    dias[2] = true
//                }
//                if i == "Toda quinta-feira" {
//                    dias[3] = true
//                }
//                if i == "Toda sexta-feira" {
//                    dias[4] = true
//                }
//                if i == "Todo sábado" {
//                    dias[5] = true
//                }
//                if i == "Todo domingo" {
//                    dias[6] = true
//                }
//            }
//        }

// Singleton.instance.adiconarTarefas(titulo: titulo[0], periodo: periodo[0], nResponsavel: responsavel[0], segunda: dias[0], terca: dias[1], quarta: dias[2], quinta: dias[3], sexta: dias[4], sabado: dias[5], domingo: dias[6])
// print(titulo)
//print(periodo)
//print(responsavel)
//        //Singleton.instance.adiconarTarefas(titulo: titulo!, periodo: periodo!, nResponsavel: responsavel!, segunda: true, terca: true, quarta: true, quinta: true, sexta: true, sabado: true, domingo: true)

// colocar a funçao de compartilhamento aqui!!!
//lembrar : boolean

