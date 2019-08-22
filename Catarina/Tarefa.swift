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
    var labelTeste:String
    var camimhoImage:String
    var aberto:Bool
    init(nTitulo:String,nDescricao:String,nlabelTeste:String,nCamimhoImage:String,nAberto:Bool) {
        self.titulo = nTitulo
        self.descricao = nDescricao
        self.labelTeste = nlabelTeste
        self.camimhoImage = nCamimhoImage
        self.aberto = nAberto
    }

}
