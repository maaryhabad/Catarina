import Foundation
import UIKit

class Singleton{
    
    static let instance = Singleton()
    var popUpAberto = false
    var popUpDescricaoAberto = false
    var periodoSeg: [Periodo]
    var periodoTer: [Periodo]
    var periodoQua: [Periodo]
    var periodoQui: [Periodo]
    var periodoSex: [Periodo]
    var periodoSab: [Periodo]
    var periodoDom: [Periodo]
    var diaSelecionado = 0
    var listaDia = [Dia]()
    private init(){
        periodoSeg = [Periodo.init(nTitulo: "Manhã", nAberto: false),
                   Periodo.init(nTitulo: "Tarde", nAberto: false),
                   Periodo.init(nTitulo: "Noite", nAberto: false)]
        periodoTer = [Periodo.init(nTitulo: "Manhã", nAberto: false),
                      Periodo.init(nTitulo: "Tarde", nAberto: false),
                      Periodo.init(nTitulo: "Noite", nAberto: false)]
        periodoQua = [Periodo.init(nTitulo: "Manhã", nAberto: false),
                      Periodo.init(nTitulo: "Tarde", nAberto: false),
                      Periodo.init(nTitulo: "Noite", nAberto: false)]
        periodoQui = [Periodo.init(nTitulo: "Manhã", nAberto: false),
                      Periodo.init(nTitulo: "Tarde", nAberto: false),
                      Periodo.init(nTitulo: "Noite", nAberto: false)]
        periodoSex = [Periodo.init(nTitulo: "Manhã", nAberto: false),
                      Periodo.init(nTitulo: "Tarde", nAberto: false),
                      Periodo.init(nTitulo: "Noite", nAberto: false)]
        periodoSab = [Periodo.init(nTitulo: "Manhã", nAberto: false),
                      Periodo.init(nTitulo: "Tarde", nAberto: false),
                      Periodo.init(nTitulo: "Noite", nAberto: false)]
        periodoDom = [Periodo.init(nTitulo: "Manhã", nAberto: false),
                      Periodo.init(nTitulo: "Tarde", nAberto: false),
                      Periodo.init(nTitulo: "Noite", nAberto: false)]
        
        listaDia.append(Dia(listaPeriodo:periodoSeg, nData: criarData(dia: 9, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodoTer, nData: criarData(dia: 10, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodoQua, nData: criarData(dia: 11, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodoQui, nData: criarData(dia: 12, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodoSex, nData: criarData(dia: 13, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodoSab, nData: criarData(dia: 14, mes: 9, ano: 2019)))
        listaDia.append(Dia(listaPeriodo:periodoDom, nData: criarData(dia: 15, mes: 9, ano: 2019)))
    }
    var userid: String!
    //funcao ADICIONAR NOVA TAREFA recebe titulo,periodo,responsavel,lembrar,repetir,dias
    func adiconarTarefas(titulo:String,periodo:String,nResponsavel:String, segunda: Bool, terca: Bool, quarta: Bool, quinta: Bool, sexta: Bool, sabado: Bool, domingo: Bool ){
        let vTarefa = Tarefa.init(nTitulo: titulo, nPeriodo: periodo, nLembrar: false, nLocal: "", nIsTarefa: true, responsavel: nResponsavel, nSegunda: segunda, nTerca: terca, nQuarta: quarta, nQuinta: quinta, nSexta: sexta, nSabado: sabado, nDomingo: domingo, data: Singleton.instance.criarData(dia: 0, mes: 0, ano: 0))
        
        var indice = 0
        for i in listaDia{
            let dateDate = Calendar(identifier: .gregorian).date(from: i.data)!
            let numDia  =  Calendar.current.component(.weekday, from: dateDate)
            if(numDia == 1 && vTarefa.repetirDomingo == true){
                verificaPeriodo(local: indice, vTarefa: vTarefa)
            }
            if(numDia == 2 && vTarefa.repetirSegunda == true){
                verificaPeriodo(local: indice, vTarefa: vTarefa)
            }
            if(numDia == 3 && vTarefa.repetirTerca == true){
                verificaPeriodo(local: indice, vTarefa: vTarefa)
            }
            if(numDia == 4 && vTarefa.repetirQuarta == true){
                verificaPeriodo(local: indice, vTarefa: vTarefa)
            }
            if(numDia == 5 && vTarefa.repetirQuinta == true){
                verificaPeriodo(local: indice, vTarefa: vTarefa)
            }
            if(numDia == 6 && vTarefa.repetirSexta == true){
                verificaPeriodo(local: indice, vTarefa: vTarefa)
            }
            if(numDia == 7 && vTarefa.repetirSabado == true){
                verificaPeriodo(local: indice, vTarefa: vTarefa)
            }
            indice += 1
        }
    }
    func verificaPeriodo(local:Int,vTarefa:Tarefa){
        if(vTarefa.periodo == "Manhã"){
            listaDia[local].listaPeriodo[0].vetorTarefas.append(vTarefa)
        }
        else if (vTarefa.periodo == "Tarde"){
            listaDia[local].listaPeriodo[1].vetorTarefas.append(vTarefa)
        }
        else{
            listaDia[local].listaPeriodo[2].vetorTarefas.append(vTarefa)
        }
    }
    func adiconarCompromisso(titulo:String, responsavel: String,data:DateComponents,periodo:String,local:String, lembrar: Bool){
        

        let comp = Tarefa.init(nTitulo: titulo, nPeriodo: periodo, nLembrar: lembrar, nLocal: local, nIsTarefa: false, responsavel: responsavel, nSegunda: false, nTerca: false, nQuarta: false, nQuinta: false, nSexta: false, nSabado: false, nDomingo: false, data: data)
        var indice = 0
        var encontrou = false
        for i in listaDia{//for varrendo a lista de dia
            if(i.data.day == comp.data.day){//verificando se o dia do compromisso existe na lista de dia
                encontrou = true
                verificaPeriodo(local: indice, vTarefa: comp)//adicionando o compromisso em seu devido dia e periodo
            }
            indice += 1
        }
        if(encontrou == false){
            listaDia[0].listaPeriodo[0].vetorTarefas.append(comp)
        }
    }
    func criarData(dia:Int,mes:Int,ano:Int)->DateComponents{
        var date = DateComponents()
        date = DateComponents(calendar: Calendar.current,year: ano, month: mes, day: dia)
        return date
    }
}

