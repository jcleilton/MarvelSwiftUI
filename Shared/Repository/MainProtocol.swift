//
//  MainProtocol.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import Foundation

protocol MainProtocol {
    func fecthData(callback: @escaping(([Hero]) -> Void))
}
