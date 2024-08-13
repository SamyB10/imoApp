//
//  GabaritListView.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/08/2024.
//
import SwiftUI

struct GabaritListView: View {
    @State var viewModel: GabaritListViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.items) { item in
                    createItem(with: item)
                        .onTapGesture {
                            handleGesture()
                        }
                        .containerRelativeFrame(.horizontal,
                                                count: viewModel.numberItemDisplay,
                                                spacing: 10.0)
                }
            }
        }
        .padding(.horizontal)
    }

    private func createItem(with item: GabaritListViewModel.ItemGabaritList) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.random)
                .frame(height: 40)
            Text("\(item.title)")
        }
    }

    private func handleGesture() {
        viewModel = GabaritListViewModel(items: (1...Int.random(in: 1...10)).map { i in
            GabaritListViewModel.ItemGabaritList(title: "\(i)")
        })
    }
}

#Preview {
    GabaritListView(viewModel: .viewModel)
}
