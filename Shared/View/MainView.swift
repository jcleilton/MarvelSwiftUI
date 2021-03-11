//
//  MainView.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 16/02/21.
//

import SwiftUI

struct MainView: View {
    init() {
        UINavigationBar.appearance().backgroundColor = .white
               
        UINavigationBar.appearance().largeTitleTextAttributes = [
                    .foregroundColor: UIColor.blue,
                    .font : UIFont(name:"Thonburi Bold", size: 40)!]
    }
    
    let heroes = [
        Hero(description: "Ironman", id: 0, modified: "", name: "", resourceURI: "", thumbnail: ""),
        Hero(description: "Capitão America", id: 1, modified: "", name: "", resourceURI: "", thumbnail: "")
    ]
    
    var body: some View {
        NavigationView{
            List(heroes) { hero in
                VStack(alignment: .center){
                    Text(hero.description ?? "")
                }
            }
            .navigationTitle("Marvel Heroes")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
