//
//  Tarefa.swift
//  Catarina
//
//  Created by akira tsukamoto on 21/08/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import Foundation

class Tarefa{
    var titulo:String
    var descricao:String
    var periodo:String
    //var aberto:Bool
    var concluido:Bool
    
    
    
init(nTitulo:String,nDescription:String,nPeriodo:String,nConcluido:Bool/*,nAberto:Bool*/) {
    self.titulo = nTitulo
    self.descricao = nDescription
    self.periodo = nPeriodo
    //self.aberto = nAberto
    self.concluido = nConcluido
    }
    
//init(fromDict:NSDictionary){
//    self.titulo = (fromDict["titulo"] as! String)
//    self.descricao = (fromDict["descricao"] as! String)
//    self.periodo = (fromDict["periodo"] as! String)
//    //self.aberto = (fromDict["aberto"] as! Bool)
//    self.concluido = (fromDict["concluido"] as! Bool)
//
//}


}
