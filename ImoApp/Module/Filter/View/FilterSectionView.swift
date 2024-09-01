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
                .padding(.bottom)
        }
        
        if section.displaySepartionBar {
            Rectangle()
                .fill(Color.black.opacity(0.2))
                .frame(height: 0.5)
                .padding(.vertical)
        }
    }
    
    
    private func createContentSections(with section: FilterViewModel.Section) -> some View {
        Group {
            switch section {
            case .typeProperty(let items):
                itemsPicker(with: items)
            case .numberOfRoom(let items),
                    .numberOfBedroom(let items):
                HStack {
                    itemsToggle(with: items)
                }
                case .price(let items):
                VStack(alignment: .leading) {
                    itemsTextField(with: items)
                }
            default:
                Text("A faire")
            }
        }
    }
    
    private func itemsToggle(with items: [FilterViewModel.Toggle]) -> some View {
        ForEach(items.indices, id: \.self) { cellIndex in
            let cell = items[cellIndex]
            FilterToggleView(cell: cell) {
                action($0)
            }
        }
    }

    private func itemsTextField(with items: [FilterViewModel.TextField]) -> some View {
        ForEach(items.indices, id: \.self) { cellIndex in
            let cell = items[cellIndex]
            FilterTextFiledView(cell: cell)
        }
    }

    private func itemsPicker(with items: [FilterViewModel.Picker]) -> some View {
        FilterPickerView(cells: items) {
            action($0)
        }
    }
}
