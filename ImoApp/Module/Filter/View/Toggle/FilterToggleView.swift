//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 28/08/2024.
//

import SwiftUI

struct FilterToggleView: View {
    var cell: FilterViewModel.Toggle
    let action: (SelectedFilterItem) -> Void
    
    var body: some View {
        accessoryView()
    }

    private func accessoryView() -> some View {
        ToggleView(viewModel: cell.viewModel()) {
            action(cell.selectedItem(with: cell.currentState()))
        }
        .disabled(cell.disabled)
        .opacity(cell.disabled ? 0.5 : 1)
    }
}
