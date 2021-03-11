//
//  RemoteImage.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import SwiftUI

class RemoteImage: ObservableObject {
    @Published var image = UIImage()
    
    init(from hero: Hero) {
        hero.getImage { [weak self] image in
            self?.image = image ?? UIImage()
        }
    }
}
