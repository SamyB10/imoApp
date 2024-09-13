//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//


struct FilterContentView: View {
    let viewModel: FilterViewModel
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        ForEach(viewModel.sections.indices, id: \.self) { sectionIndex in
            let section = viewModel.sections[sectionIndex]
            FilterSectionView(section: section) {
                action($0)
            }
            .background {
                Color.red
            }
        }
    }
}

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

                            FilterSectionView(section: section) {
                                manager.didSelectItem(with: $0)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Filter")
                .navigationBarTitleDisplayMode(.inline)
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
