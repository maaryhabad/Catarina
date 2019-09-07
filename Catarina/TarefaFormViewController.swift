import Eureka
import ContactsUI

class TarefaFormViewController: FormViewController, CNContactPickerDelegate {
   
    var selectedContact: String?
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        save()
        //print(form.values())
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section()
            <<< PickerInlineRow<String>("titulo") {
                (row: PickerInlineRow<String>) -> Void in
                row.options = ["Banho", "Amamentação", "Sono", "Alimentação", "Estímulo", "Outro"]
                row.title = "Tarefa"
                if (row.value == "Outro") {
                    // open another text row. maybe by calling a function that creates this row?
                }
            }
            +++ Section()
            <<< SegmentedRow<String>("periodo") {
                $0.options = ["Manhã", "Tarde", "Noite"]
            }
            
            +++ Section()
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
            }
            
            +++ Section()
            <<< ButtonRow("responsavel") {
                $0.title = "Contatos"
                    $0.onCellSelection(self.contato)
                }
            <<< LabelRow("contatoName") {
                $0.title = ""
                $0.hidden = true
            }
            
            +++ Section()
            <<< SwitchRow("lembrar") {
                $0.title = "Lembrar"
        }
        
    }
    
    func contato(cell: ButtonCellOf<String>, row: ButtonRow) {
        let contatoVc = CNContactPickerViewController()
        contatoVc.delegate = self
        self.present(contatoVc, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        //print(contact.phoneNumbers)
        
        selectedContact = contact.givenName
        self.form.rowBy(tag: "contatoName")?.title = selectedContact
        self.form.rowBy(tag: "contatoName")?.hidden = false
        self.form.rowBy(tag: "contatoName")?.evaluateHidden()
        self.form.rowBy(tag: "contatoName")?.updateCell()
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        self.dismiss(animated: true, completion: nil)
    }

    
    func save() {
        let formValues = form.values()
        
        var dias: [Bool] = [Bool](repeating: false, count: 7)
        let responsavel = selectedContact!
        let titulo = formValues["titulo"] as! String
        let periodo = formValues["periodo"] as! String
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
        
        print(responsavel)
        
        Singleton.instance.adiconarTarefas(titulo: titulo, periodo: periodo, nResponsavel: responsavel, segunda: dias[0], terca: dias[1], quarta: dias[2], quinta: dias[3], sexta: dias[4], sabado: dias[5], domingo: dias[6])
        //Singleton.instance.adiconarTarefas(titulo: titulo!, periodo: periodo!, nResponsavel: responsavel!, segunda: true, terca: true, quarta: true, quinta: true, sexta: true, sabado: true, domingo: true)
        
        // colocar a funçao de compartilhamento aqui!!!
        //lembrar : boolean
        
        
    }
}
