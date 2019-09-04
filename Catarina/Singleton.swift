import Foundation
import UIKit

class Singleton{
    
    static let instance = Singleton()
    var popUpAberto = false
    var popUpDescricaoAberto = false
    private init(){}
    
    var diaSelecionado: Dia!
    

   
    
    
    
    var listaDia: [Dia] = [Dia.init(listaPeriodo: [Periodo.init(nTitulo: "Manhã", tarefas: [] , nAberto: false),
                                                   Periodo.init(nTitulo: "Tarde", tarefas: [] , nAberto: false),
                                                   Periodo.init(nTitulo: "Noite", tarefas: [] , nAberto: false)], nDate: "hoje"),
                           Dia.init(listaPeriodo: [Periodo.init(nTitulo: "Manhã", tarefas: [] , nAberto: false),
                                                   Periodo.init(nTitulo: "Tarde", tarefas: [] , nAberto: false),
                                                   Periodo.init(nTitulo: "Noite", tarefas: [] , nAberto: false)], nDate:"amanha" )
    ]

    var userid: String!
    
    func adiconarTarefas(titulo:String,periodo:String,nResponsavel:String, segunda: Bool, terca: Bool, quarta: Bool, quinta: Bool, sexta: Bool, sabado: Bool, domingo: Bool ){
        let vTarefa = Tarefa.init(nTitulo: titulo, nPeriodo: periodo, nLembrar: false, nLocal: "", nIsTarefa: true, responsavel: nResponsavel, nSegunda: segunda, nTerca: terca, nQuarta: quarta, nQuinta: quinta, nSexta: sexta, nSabado: sabado, nDomingo: domingo)
        
        //titulo,periodo,responsavel,lembrar,repetir
        if(vTarefa.periodo == "Manhã"){
            listaDia[0].listaPeriodo[0].vetorTarefas.append(vTarefa)
        }
        else if (vTarefa.periodo == "Tarde"){
            listaDia[0].listaPeriodo[1].vetorTarefas.append(vTarefa)
        }
        else{
            listaDia[0].listaPeriodo[2].vetorTarefas.append(vTarefa)
        }
    }
    func adiconarCompromisso(titulo:String, lembrar: Bool,local:String, responsavel: String,data:Date){
        let vCompromisso = Tarefa.init(nTitulo: titulo, nPeriodo: "", nLembrar: lembrar, nLocal: local, nIsTarefa: false, responsavel: responsavel, nSegunda: false, nTerca: false, nQuarta: false, nQuinta: false, nSexta: false, nSabado: false, nDomingo: false)
        //titulo,responsavel,data,local,lembrar
        if(vCompromisso.periodo == "Manhã"){
            listaDia[0].listaPeriodo[0].vetorTarefas.append(vCompromisso)
        }
        else if (vCompromisso.periodo == "Tarde"){
            listaDia[0].listaPeriodo[1].vetorTarefas.append(vCompromisso)
        }
        else{
            listaDia[0].listaPeriodo[2].vetorTarefas.append(vCompromisso)
        }
        
        
    }
    
    
    
}

