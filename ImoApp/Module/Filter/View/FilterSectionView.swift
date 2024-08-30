//
//  FilterHomeSectionView.swift
//  ImoApp
//
//  Created by Boussair Samy on 23/08/2024.


import SwiftUI
struct FilterSectionView: View {

    // MARK: - Properties
    let section: FilterViewModel.Section
    let action: (SelectedFilterItem) -> Void

    // MARK: - Subviews
    var body: some View {
        Section {
            SectionHeaderView(viewModel: section.header)
            createContentSections(with: section)
        }
        Rectangle()
            .fill(Color.black.opacity(0.2))
            .frame(height: 0.5)
            .padding(.vertical)
    }

    private func createContentSections(with section: FilterViewModel.Section) -> some View {
        Group {
            switch section {
            case .typeProperty(let cells):
                itemsPicker(with: cells)
            case .numberOfRoom(let cells):
                HStack {
                    itemsToggle(with: cells)
                }
            default:
                Text("A faire")
            }
        }
    }

    private func itemsToggle(with items: [FilterViewModel.Toggle]) -> some View {
        ForEach(items, id: \.self) { cell in
            FilterToggleView(isOn: cell.currentState(),
                             cells: cell) {
                action($0)
            }
        }
    }

    private func itemsPicker(with items: [FilterViewModel.Picker]) -> some View {
            FilterPickerView(cells: items) {
                action($0)
        }
    }
}
