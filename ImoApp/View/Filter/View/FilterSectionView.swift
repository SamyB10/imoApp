//
//  FilterHomeSectionView.swift
//  ImoApp
//
//  Created by Boussair Samy on 23/08/2024.

import SwiftUI
struct FilterSectionView: View {
    let sections: [FilterViewModel.Section]
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        ForEach(sections, id: \.self) { section in
            VStack(alignment: .leading) {
                Section {
                    createContentSection(with: section.cells)
                } header: {
                    SectionHeaderView(title: section.header.rawValue)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }

    private func createContentSection(with cells: FilterViewModel.TypeCell) -> some View {
        Group {
            switch cells {
            case .picker(let cellsPicker):
                FilterPickerView(cells: cellsPicker) {
                    action($0)
                }
            case .toggle(let cellsToggle):
                FilterToggleView(cells: cellsToggle) {
                    action($0)
                }
            }
        }
    }
}
