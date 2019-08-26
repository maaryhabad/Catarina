
import Foundation

class Periodo{
    
    var titulo:String
    var quantidadeTarefas:Int
    //var quantidadeCompromissos:Int
    var vetorTarefas :[Tarefa]
    var aberto:Bool
    //var vetorCompromissos:[Compromisso]
    
    init(nTitulo:String,tarefas:[Tarefa],nAberto:Bool/*,compromissos:[Compromisso]*/) {
        self.titulo = nTitulo
       // self.vetorCompromissos = compromissos
        self.vetorTarefas = tarefas
        self.quantidadeTarefas = self.vetorTarefas.count
        self.aberto = nAberto
    
        ///self.quantidadeCompromissos = self.vetorCompromissos.count
        
    }
}
