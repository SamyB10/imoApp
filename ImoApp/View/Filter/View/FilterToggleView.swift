//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 28/08/2024.
//

import SwiftUI

struct FilterToggleView: View {
    var cells: [FilterViewModel.Toggle]
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(cells, id: \.self) { cell in
                HStack {
                    Text(cell.title)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    ToggleView(viewModel: cell.viewModel) {
                        action(cell.selectedItem)
                    }
                }
            }
        }
    }
}

#Preview {
    FilterToggleView(cells: [FilterViewModel.Toggle.one(.init(isOn: true))]) {_ in 
        print("")
    }
        .padding()
}
