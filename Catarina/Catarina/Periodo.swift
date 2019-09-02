
import Foundation

class Periodo{
    
    var titulo:String
    var quantidadeTarefas:Int
    var vetorTarefas :[Tarefa]
    var aberto:Bool
    
    
    init(nTitulo: String, tarefas:[Tarefa], nAberto:Bool) {
        self.titulo = nTitulo
        self.vetorTarefas = tarefas
        self.quantidadeTarefas = self.vetorTarefas.count
        self.aberto = nAberto
        
        
        
    }
}
