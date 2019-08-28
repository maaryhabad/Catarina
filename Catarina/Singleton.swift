import Foundation
import UIKit

class Singleton{
    
    static let instance = Singleton()
    var popUpAberto = false
    private init(){}
    var listaTarefas:[Tarefa] = []
    var nucleoFamiliar: [Familia] = []
    var listaPeriodo:[Periodo] = [Periodo.init(nTitulo: "Manhã", tarefas: [] , nAberto: false),Periodo.init(nTitulo: "Tarde", tarefas: [] , nAberto: false),Periodo.init(nTitulo: "Noite", tarefas: [] , nAberto: false)]
    var userid: String!
    
    func adiconarTarefas(titulo:String,descricao:String,periodo:String,aberto:Bool,concluido:Bool) {
        let vTarefa = Tarefa.init(nTitulo: titulo, nDescription: descricao, nPeriodo: periodo, nConcluido: concluido)
        if(vTarefa.periodo == "Manhã"){
            listaPeriodo[0].vetorTarefas.append(vTarefa)
        }
        else if (vTarefa.periodo == "Tarde"){
            listaPeriodo[1].vetorTarefas.append(vTarefa)
        }
        else{
            listaPeriodo[2].vetorTarefas.append(vTarefa)
        }
    }
    
}

