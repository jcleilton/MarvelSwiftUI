//
//  MainRepositoryMock.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import Foundation

class MainRepositoryMock: MainProtocol {
    func fecthData(callback: @escaping (([Hero]) -> Void)) {
        callback([
            Hero(description: "Ironman", id: 1, modified: "", name: "", resourceURI: "", thumbnail: ""),
            Hero(description: "Capitão América", id: 2, modified: "", name: "", resourceURI: "", thumbnail: ""),
            Hero(description: "Hulk", id: 3, modified: "", name: "", resourceURI: "", thumbnail: ""),
            Hero(description: "Viuva Negra", id: 4, modified: "", name: "", resourceURI: "", thumbnail: ""),
            Hero(description: "Thor", id: 5, modified: "", name: "", resourceURI: "", thumbnail: ""),
            Hero(description: "Dr. Estranho", id: 6, modified: "", name: "", resourceURI: "", thumbnail: ""),
            Hero(description: "Feiticeira Escarlate", id: 7, modified: "", name: "", resourceURI: "", thumbnail: "")
        ])
    }
}
