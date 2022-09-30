//
//  ListView.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 07/03/2022.
//

import SwiftUI

struct ListCellView: View {
    
    @State private var searchText = ""
    @ObservedObject private var viewModel: ViewModel = ViewModel()
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        TextField("Recherche par catégorie", text: $searchText)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            viewModel.getRecettesByCat(cat: searchText)
                        } label: {
                            Text("Filtrer !")
                        }
                    }
                    .padding()
                    ScrollView {
                        VStack{
                            ForEach(searchText.count == 0 ? viewModel.recettes : viewModel.recettesByCat, id: \.self) { recette in
                                ZStack{
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: 3)
                                    NavigationLink(
                                        destination: DetailsView(),
                                        label: {
                                            CellView(recette: recette)
                                                .foregroundColor(.black)
                                    })
                                }
                            }
                        }.padding(.horizontal,16)
                    }
                    .navigationBarTitle("Liste des recettes")
                }
            }
        }
        .onAppear {
            viewModel.getRecettes()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var previews: some View {
       ListCellView()
      
    }
}
