//
//  FilterTextFiledView.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/09/2024.
//

import SwiftUI

struct TextFieldView: View {
    @ObservedObject private(set) var viewModel: TextFieldViewModel
    @FocusState private var textFieldIsFocused: Bool
    let action: (Double) -> Void
    @State private var showAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 3) {
                TextField("", value: $viewModel.text, format: .number)
                    .keyboardType(.numbersAndPunctuation)
                    .fixedSize()

                Text("€")
            }
            .padding(5)
            .font(.system(size: 13))
            .fontWeight(.bold)
            .overlay(
                RoundedRectangle(cornerRadius: viewModel.cornerRadiusText)
                    .stroke(Color.black,
                            lineWidth: viewModel.lineWidth)
            )
        }

        .onSubmit {
            action(Double(viewModel.text))
        }
    }
}
