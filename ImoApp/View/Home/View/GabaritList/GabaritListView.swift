//
//  GabaritListView.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/08/2024.
//
import SwiftUI

struct GabaritListView: View {
    var viewModel: GabaritListViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.items) { item in
                    createItem(with: item)
                        .onTapGesture {
//                            handleGesture()
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
        var itemList: [String: String]
        switch item.type {
        case .regions(let key, let name):
            itemList = [key: name]
        case .department(let key, let name):
            itemList = [key: name]
        case .city(let key, let name):
            itemList = [key: name]
        }


        return ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.gray)
                .frame(height: 40)

            Text(itemList.values.formatted())
                .font(.system(size: 10, weight: .regular))


                .lineLimit(0)
                .padding()
        }
    }

//    private func handleGesture() {
//        viewModel = GabaritListViewModel(items: (1...Int.random(in: 1...10)).map { i in
//            GabaritListViewModel.ItemGabaritList(id: UUID().uuidString,
//                                                 type: .regions("\(i)", "\(i)"))
//        })
//    }
}

#Preview {
    GabaritListView(viewModel: .viewModel)
}
