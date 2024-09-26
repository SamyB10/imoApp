//
//  FavoriteView.swift
//  ImoApp
//
//  Created by Boussair Samy on 24/09/2024.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [HomeViewModel.ViewModel.CardHomeViewModel]

    var body: some View {
        NavigationStack {
            List {
            ForEach(items) { item in
                CardView(viewModel: item, ratio: 21/9)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
            .onDelete(perform: deleteItems)
        }

            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(.ultraThickMaterial)
            .listRowSpacing(10)
            .navigationTitle("Favorites")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                items[index].isFavorite.toggle()
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    FavoriteView()
}
