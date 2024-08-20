//
//  ToolBarCustom.swift
//  ImoApp
//
//  Created by Boussair Samy on 19/08/2024.
//

import SwiftUI

struct ToolBarCustom: View {
    var body: some View {
        Color.clear
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ImageLoaderView(dvImage: .asset("Avatar"),
                                contentMode: .fit)
                .frame(width: 30, height: 30)
            }
        }
    }
}

#Preview {
    ToolBarCustom()
}
