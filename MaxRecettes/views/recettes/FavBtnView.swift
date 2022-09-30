//
//  FavBtnView.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 11/03/2022.
//

import SwiftUI

struct FavBtnView: View {
    
    let colorOn : Color
    let colorOff : Color
    @Binding var isLiked : Bool
    var item: Recette
    @EnvironmentObject var favorite: Favorite
        
    var body: some View {
        Button(action: {
            toggle()
            if isLiked {
                favorite.addAFav(newItem: item)
                print(favorite.arrayOfFav.count)
            }
            
        }, label: {
            //opérateur ternaire
            Image(systemName : isLiked ? "heart.fill" : "heart")
                .font(.system(size: 24))
                .padding(10)
                .foregroundColor(isLiked ? colorOn : colorOff)
        })
        
    }
    
    private func toggle(){
        isLiked.toggle()
    }
}

struct ContainerView : View {
    @State private var isLiked = true
    
    var body: some View {
        FavBtnView(colorOn: .red, colorOff: .gray, isLiked: $isLiked, item: Recette(title: "", category: "", url: "", source: "", img: ""))
    }
}

struct FavBtnView_Previews: PreviewProvider {
        static var previews: some View {
            ContainerView()
        }
    }
