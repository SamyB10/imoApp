//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//
import SwiftUI
struct FavoritesButtonView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var addFavorite: Bool = false
    let item: HomeViewModel.ViewModel.CardHomeViewModel

    var body: some View {
        Button {
            print(item.id)
            withAnimation {
                item.isFavorite.toggle()
            }
        } label: {
            ImageLoaderView(dvImage: .systemName("star.circle.fill"),
                            contentMode: .fit)
        }

        .onChange(of: item.isFavorite) { _, newValue in

                newValue ? modelContext.insert(item) : modelContext.delete(item)
            
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 25, height: 25)
        .foregroundStyle(item.isFavorite ? .red : .white, .black.opacity(0.4))
        .padding(5)
    }
}
