//
//  GabaritListView.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/08/2024.
//
import SwiftUI

struct GabaritListView: View {
    let viewModel: GabaritListViewModel
    let action: (TypeActionGabaritList) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.items) { item in
                    createItem(with: item)
                        .onTapGesture {
                            guard let index = viewModel.items.firstIndex(of: item) else { return }
                            switch item.type {
                            case .regions:
                                action(.region(index))
                            case .department:
                                action(.department(index))
                            case .city:
                                action(.city(index))
                            }
                        }
                        .containerRelativeFrame(.horizontal,
                                                count: viewModel.numberItemDisplay,
                                                spacing: 10)
                }
            }
            .padding()
        }
    }

    private func createItem(with item: GabaritListViewModel.ItemGabaritList) -> some View {
        let nameRegion = nameRegion(with: item)
        return ZStack {

            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.3), radius: 5)
                .frame(height: 40)

            Text(nameRegion)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 5)
                .font(.system(size: 10, weight: .semibold))
                .lineLimit(0)
        }
    }

    private func nameRegion(with item: GabaritListViewModel.ItemGabaritList) -> String {
        switch item.type {
        case .regions(_, let name),
                .department(_, let name),
                .city(_, let name):
            return name
        }
    }


//    private func handleGesture() {
//        viewModel = GabaritListViewModel(items: (1...Int.random(in: 1...10)).map { i in
//            GabaritListViewModel.ItemGabaritList(id: UUID().uuidString,
//                                                 type: .regions("\(i)", "\(i)"))
//        })
//    }
}
//
//#Preview {
//    GabaritListView(viewModel: .viewModel, action: (Int) -> Void)
//}
