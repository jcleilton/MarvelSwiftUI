//
//  Extensions.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import Foundation

class API {
    static var manager: ConnectionSessionManager = ConnectionSessionManager()
    
    static func fecthData(with value: String = "", callback: @escaping (Result<[Hero], ErrorKind>) -> Void) {
        manager.invokeGetData(url: Constants.getURL(with: value)) { result in
            switch result {
            case .success(let data):
                do {
                    let marvelResponse = try JSONDecoder().decode(MarvelResponse.self, from: data)
                    callback(.success(marvelResponse.data.results))
                } catch {
                    return callback(.failure(ErrorKind.invalidJSON))
                }
            case .failure(let error):
                return callback(.failure(error))
            }
        }
    }
}
