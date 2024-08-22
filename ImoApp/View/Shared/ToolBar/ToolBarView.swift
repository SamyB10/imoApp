//
//  ToolBarCustom.swift
//  ImoApp
//
//  Created by Boussair Samy on 19/08/2024.
//

import SwiftUI
struct ToolBarView: View {
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
                                .foregroundStyle(.black)
                                .frame(width: 30, height: 30)
                        }

                        ImageLoaderView(dvImage: .asset("Avatar"),
                                        contentMode: .fit)
                        .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                FilterHomeView(viewModel: .filterHomeViewModelSample)
            }
    }
}

#Preview {
    ToolBarView()
}
