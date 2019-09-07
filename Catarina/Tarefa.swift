import Foundation

class Tarefa{
    var titulo:String
    var periodo:String
    var local: String
    var lembrar:Bool
    var isTarefa: Bool
    var responsavel: String
    var repetirSegunda:Bool
    var repetirTerca:Bool
    var repetirQuarta:Bool
    var repetirQuinta:Bool
    var repetirSexta:Bool
    var repetirSabado:Bool
    var repetirDomingo:Bool
    var data:DateComponents
    
    
    
    
    init(nTitulo:String,nPeriodo:String, nLembrar: Bool, nLocal: String, nIsTarefa: Bool, responsavel: String, nSegunda: Bool, nTerca: Bool, nQuarta: Bool, nQuinta: Bool, nSexta: Bool, nSabado: Bool, nDomingo: Bool,data:DateComponents) {
        self.titulo = nTitulo
        self.periodo = nPeriodo
        self.local = nLocal
        self.lembrar = nLembrar
        self.isTarefa = nIsTarefa
        self.responsavel = responsavel
        self.repetirSegunda = nSegunda
        self.repetirTerca = nTerca
        self.repetirQuarta = nQuarta
        self.repetirQuinta = nQuinta
        self.repetirSexta = nSexta
        self.repetirSabado = nSabado
        self.repetirDomingo = nDomingo
        self.data=data
    }
    
}
