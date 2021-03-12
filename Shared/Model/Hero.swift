//
//  Hero.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 16/02/21.
//

import UIKit

struct Hero: Identifiable, Decodable {
    let description: String?
    var id: Int = 0
    let modified: String?
    let name: String?
    let resourceURI: String?
    let thumbnail: Thumbnail?
    
    func getImage(completion: @escaping((UIImage?) -> Void)) {
        if let image = ImageCashing.get(forKey: self.thumbnail?.getFullPath() ?? "") {
            completion(image)
        } else {
            do {
                try ImageCashing.save(self.thumbnail?.getFullPath() ?? "", completion: { image in
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

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    func getFullPath() -> String {
        return self.path + "." + self.thumbnailExtension.rawValue
    }
}

enum Extension: String, Codable {
    case jpg = "jpg"
    case png = "png"
    case jpeg = "jpeg"
    case svg = "svg"
}
