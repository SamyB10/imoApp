//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 28/08/2024.
//

import SwiftUI

struct FilterToggleView: View {
//    @State private(set) var isOn: Bool
    var cell: FilterViewModel.Toggle
    let action: (SelectedFilterItem) -> Void
    
    var body: some View {
        accessoryView()
        //        Toggle(cells.title, isOn: $isOn)
        //            .toggleStyle(.button)
        //            .labelStyle(.titleOnly)
        //            .foregroundStyle(.black)
        //            .font(.caption)
        //            .tint(.gray)
        //            .cornerRadius(10)
        //            .overlay(
        //                RoundedRectangle(cornerRadius: 10)
        //                    .stroke(isOn ? Color.black : Color.gray,
        //                            lineWidth: isOn ? 1 : 0.5)
        //            )
        //            .onChange(of: isOn) { oldValue, newValue in
        //                action(cells.selectedItem(with: newValue))
        //            }
        //            .disabled(cells.disabled)
        //            .opacity(cells.disabled ? 0.5 : 1)
    }
    
    @MainActor
    @ViewBuilder
    private func accessoryView() -> some View {
        ToggleView(viewModel: cell.viewModel()) {
            action(cell.selectedItem(with: cell.currentState()))
        }
        .disabled(cell.disabled)
        .opacity(cell.disabled ? 0.5 : 1)
    }
}
//
//#Preview {
//    FilterToggleView(isOn: false,
//                     cells: .studio(false)) {_ in
//        print("ssss")
//    }
//}
