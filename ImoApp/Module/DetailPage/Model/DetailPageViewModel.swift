//
//  DetailPageViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/08/2024.
//

import Foundation
struct DetailPageViewModel: Identifiable, Hashable {
    let id: String
    let image: String
    let title: String
    let ownerName: String
    let price: Int
}
