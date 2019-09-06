import Foundation
import UIKit

class Singleton{
    
    static let instance = Singleton()
    var popUpAberto = false
    var popUpDescricaoAberto = false
    var periodo: [Periodo]
    var diaSelecionado = 0
    var listaDia = [Dia]()
    private init(){
        periodo = [Periodo.init(nTitulo: "Manhã", nAberto: false),
                   Periodo.init(nTitulo: "Tarde", nAberto: false),
                   Periodo.init(nTitulo: "Noite", nAberto: false)]
        
        listaDia.append(Dia(listaPeriodo:periodo, nData: criarData(dia: 9, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodo, nData: criarData(dia: 10, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodo, nData: criarData(dia: 11, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodo, nData: criarData(dia: 12, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodo, nData: criarData(dia: 13, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodo, nData: criarData(dia: 14, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodo, nData: criarData(dia: 15, mes: 9, ano: 2019)))
    }
    var userid: String!
    func adiconarTarefas(titulo:String,periodo:String,nResponsavel:String, segunda: Bool, terca: Bool, quarta: Bool, quinta: Bool, sexta: Bool, sabado: Bool, domingo: Bool ){
        let vTarefa = Tarefa.init(nTitulo: titulo, nPeriodo: periodo, nLembrar: false, nLocal: "", nIsTarefa: true, responsavel: nResponsavel, nSegunda: segunda, nTerca: terca, nQuarta: quarta, nQuinta: quinta, nSexta: sexta, nSabado: sabado, nDomingo: domingo)
        //titulo,periodo,responsavel,lembrar,repetir
        if(vTarefa.periodo == "Manhã"){
            listaDia[Singleton.instance.diaSelecionado].listaPeriodo[0].vetorTarefas.append(vTarefa)
        }
        else if (vTarefa.periodo == "Tarde"){
            listaDia[Singleton.instance.diaSelecionado].listaPeriodo[1].vetorTarefas.append(vTarefa)
        }
        else{
            listaDia[Singleton.instance.diaSelecionado].listaPeriodo[2].vetorTarefas.append(vTarefa)
        }
    }
    func adiconarCompromisso(titulo:String, lembrar: Bool,local:String, responsavel: String){
        let vCompromisso = Tarefa.init(nTitulo: titulo, nPeriodo: "", nLembrar: lembrar, nLocal: local, nIsTarefa: false, responsavel: responsavel, nSegunda: false, nTerca: false, nQuarta: false, nQuinta: false, nSexta: false, nSabado: false, nDomingo: false)
        //titulo,responsavel,data,local,lembrar
        if(vCompromisso.periodo == "Manhã"){
            listaDia[Singleton.instance.diaSelecionado].listaPeriodo[0].vetorTarefas.append(vCompromisso)
        }
        else if (vCompromisso.periodo == "Tarde"){
            listaDia[Singleton.instance.diaSelecionado].listaPeriodo[1].vetorTarefas.append(vCompromisso)
        }
        else{
            listaDia[Singleton.instance.diaSelecionado].listaPeriodo[2].vetorTarefas.append(vCompromisso)
        }
    }
    func criarData(dia:Int,mes:Int,ano:Int)->DateComponents{
        var date = DateComponents()
        date = DateComponents(calendar: Calendar.current,year: ano, month: mes, day: dia)
        return date
    }
    
    
}

