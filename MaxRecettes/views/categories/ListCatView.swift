//
//  ListCatView.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 08/03/2022.
//

import SwiftUI

struct ListCatView: View {
    
    @ObservedObject private var viewModel: ViewModel = ViewModel()

        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.categories, id: \.self) { item in
                            CellCatView(category: item.category)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Liste des catégories")
                .onAppear {
                    viewModel.getCategories()
                }
            }
        }
    }
}

struct ListCatView_Previews: PreviewProvider {
    static var previews: some View {
        ListCatView()
    }
}
