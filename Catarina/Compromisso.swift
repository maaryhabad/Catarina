
import Foundation

class Compromisso{
    
    var titulo:String
    var local: String
    var observacao:String
    var lembrar:Bool
    var periodo: Date
    var responsavel: String

    init(nTitulo:String,nLocal:String,nObservacao:String,nLembrar: Bool, nPeriodo: Date, responsavel: String) {
        self.lembrar = nLembrar
        self.local = nLocal
        self.observacao = nObservacao
        self.titulo = nTitulo
        self.periodo = nPeriodo
        self.responsavel = responsavel
    }
}

