//
//  FilterPickerView.swift
//  ImoApp
//
//  Created by Boussair Samy on 27/08/2024.
//

import SwiftUI
struct FilterPickerView: View {
    @State private var selectedProperty: FilterViewModel.Picker = .appartment(true)
    var cells: [FilterViewModel.Picker]
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Picker("Property", selection: $selectedProperty) {
                ForEach(cells, id: \.self) { cell in
                    Text(cell.title)
                }
            }
        }
        .pickerStyle(.segmented)
        .padding()

        .onAppear {
            updateCellSelected()
        }

        .onChange(of: selectedProperty) {
            action(selectedProperty.selectedItem)
        }
    }

    private func updateCellSelected() {
        guard let cellSelected = cells.first(where: { $0.currentState == true }) else { return }
        selectedProperty = cellSelected
    }
}
