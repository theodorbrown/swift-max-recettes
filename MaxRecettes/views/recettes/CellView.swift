//
//  CellView.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 07/03/2022.
//

import SwiftUI
import Kingfisher

struct CellView: View {
    
    var recette: Recette
    @State var isFav = false

    
    var body: some View {
        HStack {
            KFImage(URL(string : (recette.img == nil ? "" : recette.img)!))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(20)
                .padding(.trailing,8)//espace entre image et texte.
            VStack(alignment: .leading) {
                Text(recette.title.count > 15 ? "\(String(recette.title.prefix(15)))..." : recette.title)
                    .font(.system(.title2))
                    .fontWeight(.semibold)
                Text(recette.category)
            }
            Spacer()
            FavBtnView(colorOn: .red, colorOff: .gray, isLiked: $isFav, item: recette)

        }.padding(8)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
       // CellView()
        EmptyView()
    }
}
