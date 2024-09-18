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
        switch section.headerApperance {
        case .areaSquareMeter,
                .localisation,
                .enery,
                .builYear:
            HStack {
                createDisclosureGroup()
            }
        default:
            createSection()
        }
        if section.displaySepartionBar {
            Rectangle()
                .fill(Color.black.opacity(0.2))
                .frame(height: 0.5)
                .padding(.vertical)
        }
    }

    private func createSection() -> some View {
        Section {
            HStack {
                createContentSections(with: section)
            }

            .padding(.bottom)
            .padding(.horizontal)
        } header: {
            SectionHeaderView(viewModel: section.header)
        }
    }

    private func createDisclosureGroup() -> some View {
        DisclosureGroup {
            HStack {
                createContentSections(with: section)
            }
            .padding(.vertical)
            .padding(.horizontal)
        } label: {
            SectionHeaderView(viewModel: section.header)
        }
        .tint(.black)
    }

    private func createContentSections(with section: FilterViewModel.Section) -> some View {
        Group {
            ForEach(section.cells.indices, id: \.self) { index in
                let cell = section.cells[index]
                switch cell.appearance {
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
