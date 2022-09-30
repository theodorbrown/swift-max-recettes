//
//  MaxRecettesApp.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 07/03/2022.
//

import SwiftUI

@main
struct MaxRecettesApp: App {
    
    @StateObject var favorite = Favorite()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(favorite)
        }
    }
}
