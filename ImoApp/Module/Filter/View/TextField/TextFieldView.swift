//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/09/2024.
//

import SwiftUI
struct TextFieldView: View {
    @ObservedObject private(set) var viewModel: TextFieldViewModel
    @FocusState private var focusedField: Bool
    let action: (Int) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                TextField("", value: $viewModel.text, format: .number, prompt: Text(viewModel.prompt))
                    .padding(.vertical, 10)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .padding(.top, 35)
                    )
                    .foregroundColor(.black)
            }
        }
        .padding(.bottom)

        .onSubmit {
            action(viewModel.text ?? 0)
        }
    }
}
