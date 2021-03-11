//
//  MainView.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 16/02/21.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    init(_ viewModel: MainViewModel) {
        UINavigationBar.appearance().backgroundColor = Constants.navigationBarBackgroundColor
               
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: Constants.navigationBarForegroundColor,
            .font : Constants.mainFont]
        self.viewModel = viewModel
        self.viewModel.fetchData()
    }
    
    var body: some View {
        NavigationView{
            List(self.viewModel.heroes) { hero in
                RowView(hero)
            }
            .navigationTitle("Marvel Heroes")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(MainViewModel(with: MainRepositoryMock()))
    }
}
