//
//  RowView.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import Foundation
import SwiftUI

struct RowView: View {
    var hero: Hero
    @ObservedObject var remoteImage: RemoteImage
    
    init(_ hero: Hero) {
        self.hero = hero
        self.remoteImage = RemoteImage(from: hero)
    }
    
    var body: some View {
        return VStack(alignment: .center){
            Text(hero.description ?? "")
        }
    }
}
