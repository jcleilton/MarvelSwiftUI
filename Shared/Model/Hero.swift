//
//  Hero.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 16/02/21.
//

import UIKit

struct Hero: Identifiable, Decodable {
    let description: String?
    let id: Int
    let modified: String?
    let name: String?
    let resourceURI: String?
    let thumbnail: String?
        
    mutating func getImage(completion: @escaping((UIImage?) -> Void)) {
        if let image = ImageCashing.get(forKey: self.thumbnail ?? "") {
            completion(image)
        } else {
            do {
                try ImageCashing.save(self.thumbnail ?? "", completion: { image in
                    completion(image)
                })
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
