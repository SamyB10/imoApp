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
                Toggle(viewModel.title ?? "kkk",
                       isOn: $viewModel.isOn)
                .background(viewModel.isOn ?
                            viewModel.theme.opacity(1) : viewModel.theme.opacity(0.5) )
                .toggleStyle(.button)
                .labelStyle(.titleOnly)
                .foregroundStyle(.black)
                .font(.system(size: 13))
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
    ToggleView(viewModel: .init(apperance: .button, isOn: false, theme: .blue), action: nil)
}


