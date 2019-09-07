import Eureka
import ContactsUI

class TarefaFormViewController: FormViewController, CNContactPickerDelegate {
   
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        save()
        print(form.values())
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
        print(contact.phoneNumbers)
        
        let numbers = contact.phoneNumbers.first
        let responsavel = contact.namePrefix
        self.form.rowBy(tag: "responsavel")?.title = responsavel
        print((numbers?.value)?.stringValue ?? "")
        print(responsavel)
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        self.dismiss(animated: true, completion: nil)
    }

    
    func save() {
        let formValues = form.values()

        let titulo = formValues["titulo"] as! String
        let periodo = formValues["periodo"] as! String
        // let responsavel = formValues["responsavel"] as! String
        
        
        Singleton.instance.adiconarTarefas(titulo: titulo, periodo: periodo, nResponsavel: "ddsf", segunda: true, terca: false, quarta: false, quinta: false, sexta: false, sabado: false, domingo: false)
        //Singleton.instance.adiconarTarefas(titulo: titulo!, periodo: periodo!, nResponsavel: responsavel!, segunda: true, terca: true, quarta: true, quinta: true, sexta: true, sabado: true, domingo: true)
        
        // colocar a funçao de compartilhamento aqui!!!
        //lembrar : boolean
        
        
    }
}
