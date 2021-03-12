//
//  MainViewModel.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import Foundation

class MainViewModel: ObservableObject {
    private let repository: MainProtocol
    
    @Published var heroes: [Hero] = []
    
    init(with repository: MainProtocol) {
        self.repository = repository
    }
    
    func fetchData() {
        self.repository.fecthData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let heroes):
                    self?.heroes = heroes
                case .failure(let error):
                    self?.onError(error)
                }
            }
        }
    }
    
    private func onError(_ error: ErrorKind) {
        print(error.localizedDescription)
    }
}
