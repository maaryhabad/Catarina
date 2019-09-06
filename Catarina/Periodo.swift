
import Foundation

class Periodo{
    
    var titulo:String
    var quantidadeTarefas:Int
    var vetorTarefas = [Tarefa]()
    var aberto:Bool
    
    
    init(nTitulo: String, nAberto:Bool) {
        self.titulo = nTitulo
        self.quantidadeTarefas = self.vetorTarefas.count
        self.aberto = nAberto
        
        
        
    }
}
