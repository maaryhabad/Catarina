import Foundation
import UIKit

class Singleton{
    static let instance = Singleton()
    var popUpAberto = false
    private init(){}
    var listaTarefas:[Tarefa] = []
    var userid: String!
    func adiconarTarefas(titulo:String,descricao:String,periodo:String,aberto:Bool,concluido:Bool){
        self.listaTarefas.append(Tarefa.init(nTitulo: titulo, nDescription: descricao, nPeriodo: periodo, nAberto: aberto, nConcluido: concluido))
    }
    
}

