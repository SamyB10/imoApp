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
            switch section.cells {
            case .picker(let cellsPicker):
                FilterPickerView(cells: cellsPicker) {
                    action($0)
                }
            }
        }
    }
}
