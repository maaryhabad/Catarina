import Foundation
import UIKit

class Singleton{
    
    static let instance = Singleton()
    var popUpAberto = false
    var popUpDescricaoAberto = false
    private init(){}
    var listaPeriodo:[Periodo] = [Periodo.init(nTitulo: "Manhã", tarefas: [] , nAberto: false),
                                  Periodo.init(nTitulo: "Tarde", tarefas: [] , nAberto: false),
                                  Periodo.init(nTitulo: "Noite", tarefas: [] , nAberto: false)]
    var userid: String!
    
    func adiconarTarefas(titulo:String,descricao:String,periodo:String,concluido:Bool) {
        let vTarefa = Tarefa.init(nTitulo: titulo, nDescription: descricao, nPeriodo: periodo, nLembrar: false, nLocal: "", nIsTarefa: true)
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
    func adiconarCompromisso(titulo:String,descricao:String,periodo:String,concluido:Bool, lembrar: Bool,local:String){
        let vCompromisso = Tarefa.init(nTitulo: titulo, nDescription: descricao, nPeriodo: periodo, nLembrar: lembrar, nLocal: local, nIsTarefa: false)
        if(vCompromisso.periodo == "Manhã"){
            listaPeriodo[0].vetorTarefas.append(vCompromisso)
        }
        else if (vCompromisso.periodo == "Tarde"){
            listaPeriodo[1].vetorTarefas.append(vCompromisso)
        }
        else{
            listaPeriodo[2].vetorTarefas.append(vCompromisso)
        }
        
        
    }
}

