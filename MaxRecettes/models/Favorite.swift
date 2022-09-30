//
//  Favorite.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 11/03/2022.
//

import Foundation

class Favorite: ObservableObject {
    @Published var arrayOfFav: [Recette] = []
    
    func addAFav(newItem: Recette){
        arrayOfFav.append(newItem)
    }
}
