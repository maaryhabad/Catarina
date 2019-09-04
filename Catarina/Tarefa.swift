import Foundation

class Tarefa{
    var titulo:String
    var descricao:String
    var periodo:String
    var local: String
    var lembrar:Bool
    var isTarefa: Bool
    var responsavel: String
    
    init(nTitulo:String,nDescription:String,nPeriodo:String, nLembrar: Bool, nLocal: String, nIsTarefa: Bool, responsavel: String) {
        self.titulo = nTitulo
        self.descricao = nDescription
        self.periodo = nPeriodo
        self.local = nLocal
        self.lembrar = nLembrar
        self.isTarefa = nIsTarefa
        self.responsavel = responsavel
    }
    
}
