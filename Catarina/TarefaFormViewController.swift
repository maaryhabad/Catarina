import Eureka

class TarefaFormViewController: FormViewController {
    
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
            <<< TextRow("responsavel") {
                $0.title = "Responsável"
            }
            
            +++ Section("repete")
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
            <<< SwitchRow("lembrar") {
                $0.title = "Lembrar"
        }
        
    }
    
    func save() {
        let formValues = form.values()

        let titulo = formValues["titulo"] as? String
        let periodo = formValues["periodo"] as? String
        let responsavel = formValues["responsavel"] as? String
        
        
        Singleton.instance.adiconarTarefas(titulo: titulo!, periodo: periodo!, nResponsavel: responsavel!, segunda: true, terca: true, quarta: true, quinta: true, sexta: true, sabado: true, domingo: true)
        
        // colocar a funçao de compartilhamento aqui!!!
        //lembrar : boolean
        
        
    }
}
