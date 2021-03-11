//
//  MarvelSwiftUIApp.swift
//  Shared
//
//  Created by Jose Cleilton Feitosa on 16/02/21.
//

import SwiftUI

@main
struct MarvelSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(MainViewModel(with: MainRepositoryMock()))
        }
    }
}
