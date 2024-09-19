//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import SwiftUI
struct FilterView: View {
    @ObservedObject var manager: FilterViewManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    if let viewModel = manager.viewModel {
                        ForEach(viewModel.sections.indices, id: \.self) { sectionIndex in
                            let section = viewModel.sections[sectionIndex]

                            FilterSectionView(section: section) { action in
                                guard let action else { return }
                                manager.didSelectItem(with: action)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Filter")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        if let viewModel = manager.viewModel {
                            Menu {
                                FilterMenuView(sections: viewModel.menuItemFilter.section)
                            } label: {
                                Label("Menu", systemImage: "ellipsis.circle")
                            }
                            .tint(.black)
                        }
                    }
                }
                .onAppear {
                    manager.didLoad()
                }
            }
            .background(.white)
        }
    }
}

#Preview {
    FilterView(manager: FilterViewManager(interacor: FilterInteractor()))
}


struct FilterMenuView: View {
    let sections: [FilterViewModel.SectionMenuFilter]

    var body: some View {
        ForEach(sections.indices, id: \.self) { sectionIndex in
            let section = sections[sectionIndex]
            FilterViewOrder(items: section.order)
        }
    }
}

struct FilterViewOrder: View {
    let items: [FilterViewModel.Order]
    @State var selection: FilterViewModel.Order = .orderPriceAsc(true)

    var body: some View {
        Picker("Order", selection: $selection) {
            ForEach(items, id: \.self) { cell in
                Text(cell.title)
            }
        }

        .onAppear {
            updateCellSelected()
        }
    }

    private func updateCellSelected() {
        guard let itemSelected = items.first(where: { $0.currentState == true }) else { return }
        selection = itemSelected
    }
}


