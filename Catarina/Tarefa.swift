import Foundation

class Tarefa{
    var titulo:String
    var descricao:String
    var periodo:String
    //var aberto:Bool
    var concluido:Bool
    
    init(nTitulo:String,nDescription:String,nPeriodo:String,nConcluido:Bool/*,nAberto:Bool*/) {
        self.titulo = nTitulo
        self.descricao = nDescription
        self.periodo = nPeriodo
        self.concluido = nConcluido
    }
    
}
