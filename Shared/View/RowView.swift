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
        return HStack(){
            Image(uiImage: remoteImage.image)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.05))
            Text(hero.name ?? "").font(.subheadline)
        }.frame(height: 60)
    }
}
