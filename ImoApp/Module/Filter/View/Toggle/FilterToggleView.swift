//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 28/08/2024.
//

import SwiftUI

struct FilterToggleView: View {
    @State private(set) var isOn: Bool
    var cells: FilterViewModel.Toggle
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        Toggle(cells.title, isOn: $isOn)
            .toggleStyle(.button)
            .labelStyle(.titleOnly)
            .foregroundStyle(.black)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: isOn ? 0 : 1)
            )
            .onChange(of: isOn) { oldValue, newValue in
                action(cells.selectedItem(with: newValue))
            }
    }
}

#Preview {
    FilterToggleView(isOn: false,
                     cells: .studio(false)) {_ in
        print("ssss")
    }
}
