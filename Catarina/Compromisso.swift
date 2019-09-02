
import Foundation

class Compromisso{
    
    var titulo:String
    //var data: NSDate
    //var horario
    var local: String
    var observacao:String
    var lembrar:Bool
    var periodo: String
    
    
    init(nTitulo:String,nLocal:String,nObservacao:String,nLembrar: Bool, nPeriodo: String) {
        self.lembrar = nLembrar
        self.local = nLocal
        self.observacao = nObservacao
        self.titulo = nTitulo
        self.periodo = nPeriodo
    }
}

