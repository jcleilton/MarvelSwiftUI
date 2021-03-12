//
//  MarvelResponse.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import Foundation

struct MarvelResponse: Decodable {
    var code: Int = -1
    var status: String = ""
    var data: MarvelData
}

struct MarvelData: Decodable {
    var offset: Int = 0
    var limit: Int = 10
    var total: Int = 0
    var results: [Hero] = []
}
