
import Foundation

class Periodo{
    
    var titulo:String
    var quantidadeTarefas:Int
    var vetorTarefas :[Tarefa]
    var vetorCompromisso: [Compromisso]
    var aberto:Bool
    
    
    init(nTitulo: String, tarefas:[Tarefa], nAberto:Bool, compromissos:[Compromisso]) {
        self.titulo = nTitulo
        self.vetorTarefas = tarefas
        self.quantidadeTarefas = self.vetorTarefas.count
        self.aberto = nAberto
        self.vetorCompromisso = compromissos
        
        
        
    }
}
