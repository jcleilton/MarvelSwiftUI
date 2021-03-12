//
//  Constants.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 11/03/21.
//

import UIKit

fileprivate let PUBLIC_KEY = "124e0927e82cf1c2919b72eeda4c55e0"
fileprivate let PRIVATE_KEY = "a1b10ff8ace7e6bcaf20b9d37ca2dc3eaa2fbf13"
fileprivate let BASE_URL = "https://gateway.marvel.com/v1/public/characters"

struct Constants {
    static let mainFont = UIFont(name:"Thonburi Bold", size: 40)!
    static let navigationBarForegroundColor = UIColor.blue
    static let navigationBarBackgroundColor = UIColor.white
    
    static private func getQuery(from value: String) -> String {
        return value == "" ? "" : "&nameStartsWith=\(value.replacingOccurrences(of: " ", with: "%20"))"
    }
    
    static private func getTS(_ time: Date) -> String {
        return String(time.timeIntervalSince1970)
    }
    
    static private func getHash(_ ts: String) -> String {
        return (ts + PRIVATE_KEY + PUBLIC_KEY).md5.lowercased()
    }
    
    static func getURL(offset: Int = -1, with value: String) -> String {
        let offSetString = offset == -1 ? "" : "&offset=\(offset)"
        let tsTime = Date()
        let ts = getTS(tsTime)
        let hash = getHash(ts)
        let nameStartsWith = getQuery(from: value)
        return BASE_URL + "?ts=\(ts)&apikey=\(PUBLIC_KEY)&hash=\(hash)\(offSetString)&limit=10\(nameStartsWith)"
    }
    
    static let placeholderImage = UIImage(named: "marvel") ?? UIImage()
}
