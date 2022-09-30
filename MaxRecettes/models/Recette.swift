//
//  Recette.swift
//  MaxRecettes
//
//  Created by Theodor Brown on 08/03/2022.
//

import Foundation

struct Recette: Codable, Hashable {
    let title: String
    let category: String
    let url: String
    let source: String
    let img: String?
}
