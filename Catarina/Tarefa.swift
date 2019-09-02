import Foundation

class Tarefa{
    var titulo:String
    var descricao:String
    var periodo:String
    //var data: NSDate
    //var horario
    var local: String
    var lembrar:Bool
    var isTarefa: Bool
    
    init(nTitulo:String,nDescription:String,nPeriodo:String, nLembrar: Bool, nLocal: String, nIsTarefa: Bool) {
        self.titulo = nTitulo
        self.descricao = nDescription
        self.periodo = nPeriodo
        self.local = nLocal
        self.lembrar = nLembrar
        self.isTarefa = nIsTarefa
    }
    
}
