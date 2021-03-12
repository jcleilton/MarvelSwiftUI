//
//  ImageCashing.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 16/02/21.
//

import UIKit

class ImageCashing {
    class func save(_ imageURL: String, completion: @escaping(UIImage?) -> Void) throws {
        guard let url = URL(string: imageURL) else {
            throw ConnectionSessionError.invalidUrl
        }
        API.manager.downloadImage(from: url) { (image, err) in
            if let _ = err {
                completion(nil)
            } else {
                guard let image = image else {
                    completion(nil)
                    return
                }
                let data = image.jpegData(compressionQuality: 1.0)
                UserDefaults.standard.set(data, forKey: imageURL)
                UserDefaults.standard.synchronize()
                completion(image)
            }
        }
    }
    
    class func get(forKey: String) -> UIImage? {
        let data = UserDefaults.standard.object(forKey: forKey) as? Data
        if let dataImage = data {
            let img = UIImage(data: dataImage)
            return img
        }
        
        return nil
    }
}

