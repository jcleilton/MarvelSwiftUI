//
//  MainRepository.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import Foundation

class MainRepository: MainProtocol {
    func fecthData(callback: @escaping (Result<[Hero], ErrorKind>) -> Void) {
        API.fecthData(with: "") { result in
            switch result {
            case .success(let heroes):
                callback(.success(heroes))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
