//
//  ListFav.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 11/03/2022.
//

import SwiftUI

struct ListFav: View {
    
    @EnvironmentObject var favorite: Favorite
    
    
    var body: some View {
        NavigationView {
                if favorite.arrayOfFav.count != 0 {
                    List {
                        ForEach(favorite.arrayOfFav, id:\.self) { item in
                            HStack {
                                Text (item.title)
                                Spacer()
                                Link("Ouvrir", destination: URL(string: item.url)!)
                            }
                        }
                    }
                    .navigationBarTitle("Liste des favoris")
                } else {
                    Text("Aucun favori enregistré !")
                        .font(.title)
                        .fontWeight(.semibold)
                }
        }
    }
}

struct ListFav_Previews: PreviewProvider {
    static var previews: some View {
        ListFav()
    }
}
