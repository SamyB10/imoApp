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
    @State private var topExpanded = false
    // MARK: - Subviews
    var body: some View {
        Section {
            switch section.headerApperance {
            case .numberOfRoom,
                    .numberOfBedroom,
                    .areaSquareMeter,
                    .areaSquareMeterField,
                    .localisation,
                    .builYear:
                SectionHeaderView(viewModel: section.header)
                    .padding(.bottom)
                HStack {
                    createContentSections(with: section)
                }
            default:
                SectionHeaderView(viewModel: section.header)
                    .padding(.bottom)
                createContentSections(with: section)
            }
        }
        .padding(.horizontal)
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
                case .slider(let item):
                    itemSlider(with: item)
                case let .textField(item):
                    itemTextField(with: item)
                }
            }
        }
        .padding(.bottom)
    }

    private func itemToggle(with items: FilterViewModel.Toggle) -> some View {
        FilterToggleView(cell: items) {
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

    private func itemTextField(with item: FilterViewModel.TextField) -> some View {
        TextFieldView(viewModel: item.viewModel()) { _ in
            print("e")
        }
    }
}
