import Foundation
import UIKit

class Singleton{
    
    static let instance = Singleton()
    var popUpAberto = false
    var popUpDescricaoAberto = false
    private init(){}
    var listaTarefas:[Tarefa] = []
    var listaCompromisso:[Tarefa] = []
    var nucleoFamiliar: [Familia] = []
    var listaPeriodo:[Periodo] = [Periodo.init(nTitulo: "Manhã", tarefas: [] , nAberto: false, compromissos: []),
                                  Periodo.init(nTitulo: "Tarde", tarefas: [] , nAberto: false, compromissos: []),
                                  Periodo.init(nTitulo: "Noite", tarefas: [] , nAberto: false, compromissos: [])]
    var userid: String!
    
    func adiconarTarefas(titulo:String,descricao:String,periodo:String,concluido:Bool) {
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
    func adiconarCompromisso(titulo: String, local: String, observacao: String, lembrar: Bool, periodo: String){
        let vCompromisso = Compromisso.init(nTitulo: titulo, nLocal: local, nObservacao: observacao, nLembrar: lembrar, nPeriodo: periodo)
        if(vCompromisso.periodo == "Manhã"){
            listaPeriodo[0].vetorCompromisso.append(vCompromisso)
        }
        else if (vCompromisso.periodo == "Tarde"){
            listaPeriodo[1].vetorCompromisso.append(vCompromisso)
        }
        else{
            listaPeriodo[2].vetorCompromisso.append(vCompromisso)
        }
        
        
    }
}

