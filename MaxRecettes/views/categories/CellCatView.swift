//
//  CellCatView.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 07/03/2022.
//

import SwiftUI

struct CellCatView: View {
    
    var category: String = "Catégrorie"
    
    var body: some View {
        Text(category)
            .fontWeight(.semibold)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
            .foregroundColor(.white)
            .padding()
            .background(Color.gray)
            .cornerRadius(15)
            .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2)
                )
        
    }
}

struct CellCatView_Previews: PreviewProvider {
    static var previews: some View {
        CellCatView()
    }
}
