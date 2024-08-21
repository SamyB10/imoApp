//
//  ToolBarCustom.swift
//  ImoApp
//
//  Created by Boussair Samy on 19/08/2024.
//

import SwiftUI

struct ToolBarCustom: View {
    @State private var showSheet = false

    var body: some View {
        Color.clear
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button {
                            showSheet = true
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .frame(width: 30, height: 30)
                        }

                        ImageLoaderView(dvImage: .asset("Avatar"),
                                        contentMode: .fit)
                        .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                // Contenu de la feuille modale
                Color.random
            }
    }
}

#Preview {
    ToolBarCustom()
}
