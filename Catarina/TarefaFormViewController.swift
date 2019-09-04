import Eureka

class TarefaFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Nova Tarefa")
            <<< PickerRow<String>("titulo") {
                (row: PickerRow<String>) -> Void in
                row.options = ["Banho", "Amamentação", "Sono", "Alimentação", "Estímulo", "Outro"]
                row.title = "Tarefa"
                }
            
            <<< SegmentedRow<String>("periodo") {
                $0.title = "Período"
                $0.options = ["Manhã", "Tarde", "Noite"]
            }
            
            <<< TextRow("responsavel") {
                $0.title = "Responsável"
        }
        
    }
    
    func save() -> Tarefa {
        let formValues = form.values()
        
        let titulo = formValues["titulo"] as! String
        let periodo = formValues["periodo"] as! String
        let responsavel = formValues["responsavel"] as! String
        
        
        let tarefa = Tarefa.init(nTitulo: titulo, nPeriodo: periodo, nLembrar: false, nLocal: "", nIsTarefa: true, responsavel: responsavel, nSegunda: false, nTerca: false, nQuarta: false, nQuinta: false, nSexta: false, nSabado: false, nDomingo: false)
        
        
        return tarefa
        
        // colocar a funçao de compartilhamento aqui!!!
        
    }
}
