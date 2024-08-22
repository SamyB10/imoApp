//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//
import SwiftUI
struct FavoritesButtonView: View {
    @State private var addFavorite: Bool = false

    var body: some View {
        Button {
            withAnimation {
                addFavorite.toggle()
            }
        } label: {
            ImageLoaderView(dvImage: .systemName("heart.circle.fill"),
                            contentMode: .fit)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 25, height: 25)
        .foregroundStyle(addFavorite ? .red : .white, .black.opacity(0.4))
        .padding(5)
    }
}

#Preview {
    FavoritesButtonView()
}
