//
//  ToggleView.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/08/2024.
//

import SwiftUI

struct ToggleView: View {
    @ObservedObject private(set) var viewModel: ToggleViewModel
    public typealias Action = (() -> Void)
    private let action: Action?

    init(viewModel: ToggleViewModel,
         action: Action?) {
        self.viewModel = viewModel
        self.action = action
    }

    var body: some View {
        HStack {
            switch viewModel.apperance {
            case .switch:
                Toggle(isOn: $viewModel.isOn) {
                    if let title = viewModel.title {
                        Text("\(title)")
                    }
                }
                .tint(.blue)
            case .button:
                Toggle(viewModel.title ?? "90",
                       isOn: $viewModel.isOn)
                .toggleStyle(.button)
                .labelStyle(.titleOnly)
                .foregroundStyle(.black)
//                .font(.caption)
                .font(.system(size: 15))
                .tint(.gray)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(viewModel.isOn ? Color.black : Color.gray,
                                lineWidth: viewModel.isOn ? 1 : 0.5)
                )

            }
        }
        .onChange(of: viewModel.isOn) { oldValue, newValue in
            if let action = action {
                action()
            }
        }
    }
}

#Preview {
    ToggleView(viewModel: .init(apperance: .button, isOn: true), action: nil)
}


