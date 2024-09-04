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

            switch section.headerApperance {
            case .numberOfRoom,
                    .numberOfBedroom:
                HStack {
                    createContentSections(with: section)
                }
            default:
                createContentSections(with: section)
            }
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
            ForEach(section.cells.indices, id: \.self) { index in
                let cell = section.cells[index]
                switch cell.apperance {
                case .picker(let items):
                    itemPicker(with: items)
                case .toggle(let item):
                    itemToggle(with: item)
                case .textField(let item):
                    itemTextField(with: item)
                case .slider(let item):
                    itemSlider(with: item)
                }
            }
        }
    }

    private func itemToggle(with items: FilterViewModel.Toggle) -> some View {
        FilterToggleView(cell: items) {
            action($0)
        }
    }

    private func itemTextField(with items: FilterViewModel.TextField) -> some View {
        FilterTextFiledView(cell: items) {
            action($0)
        }
    }

    private func itemPicker(with items: [FilterViewModel.Picker]) -> some View {
        FilterPickerView(cells: items) {
            action($0)
        }
    }

    private func itemSlider(with item: FilterViewModel.Slider) -> some View {
        FilterSliderView(cell: item) {
            action($0)
        }
    }
}
