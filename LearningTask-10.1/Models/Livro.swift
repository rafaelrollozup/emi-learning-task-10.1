//
//  Livro.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import Foundation

enum TipoDeLivro: Int, CaseIterable {
    case ebook = 0
    case impresso = 1
    case combo = 2
    
    var titulo: String {
        switch self {
        case .ebook:
            return "E-book"
        case .impresso:
            return "Impresso"
        case .combo:
            return "E-book + impresso"
        }
    }
}

struct Preco {
    let valor: Decimal
    let tipoDeLivro: TipoDeLivro
}

struct Livro {
    let titulo: String
    let subtitulo: String
    let imagemDeCapaURI: String
    let autor: Autor
    let precos: [Preco]
    
    init(titulo: String, subtitulo: String, imagemDeCapaURI: String, autor: Autor, precos: [Preco]) {
        self.titulo = titulo
        self.subtitulo = subtitulo
        self.imagemDeCapaURI = imagemDeCapaURI
        self.autor = autor
        self.precos = precos
    }
}
