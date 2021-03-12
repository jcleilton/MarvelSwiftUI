//
//  MainRepositoryMock.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import Foundation

class MainRepositoryMock: MainProtocol {
    func fecthData(callback: @escaping (Result<[Hero], ErrorKind>) -> Void) {
        let thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpeg)
        callback(.success([
            Hero(description: "Ironman", id: 1, modified: "", name: "Ironman", resourceURI: "", thumbnail: thumbnail),
            Hero(description: "Capitão América", id: 2, modified: "", name: "Capitão América", resourceURI: "", thumbnail: thumbnail),
            Hero(description: "Hulk", id: 3, modified: "", name: "", resourceURI: "Hulk", thumbnail: thumbnail),
            Hero(description: "Viuva Negra", id: 4, modified: "", name: "Viuva Negra", resourceURI: "", thumbnail: thumbnail),
            Hero(description: "Thor", id: 5, modified: "", name: "", resourceURI: "Thor", thumbnail: thumbnail),
            Hero(description: "Dr. Estranho", id: 6, modified: "", name: "Dr. Estranho", resourceURI: "", thumbnail: thumbnail),
            Hero(description: "Feiticeira Escarlate", id: 7, modified: "", name: "Feiticeira Escarlate", resourceURI: "", thumbnail: thumbnail)
        ]))
    }
}
