//
//  TabView.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 11/03/2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ListCellView()
                .tabItem {
                    Label("Recettes", systemImage: "magnifyingglass")
                }
            ListCatView()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet")
                }
            ListFav()
                .tabItem {
                    Label("Favoris", systemImage: "heart")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
