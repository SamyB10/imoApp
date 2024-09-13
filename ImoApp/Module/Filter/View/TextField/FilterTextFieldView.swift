//
//  FilterTextFiledView.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/09/2024.
//

import SwiftUI

struct TextFieldViewPrice: View {
    @ObservedObject private(set) var viewModel: TextFieldViewModel
    @FocusState private var textFieldIsFocused: Bool
    let action: (Double) -> Void
    @State private var showAlert = false
    @State private var oldValue: Int?
    private let rangeMaxPrice = 1000000000.0

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 3) {
                TextField("", value: $viewModel.text, format: .number, prompt: Text(viewModel.prompt))
                    .keyboardType(.numbersAndPunctuation)
                    .fixedSize()

                Text("€")
                    .foregroundStyle(viewModel.text != nil ? .black : .gray.opacity(0.5))
            }
            .padding(10)
            .font(.system(size: 13))
            .fontWeight(.bold)
            .overlay(
                RoundedRectangle(cornerRadius: viewModel.cornerRadiusText)
                    .stroke(Color.black,
                            lineWidth: viewModel.lineWidth)
            )
        }

        .onChange(of: viewModel.text, { oldValue, newValue in
            self.oldValue = oldValue
            guard let price = viewModel.text else { return }
            let priceDouble = Double(price)
            if priceDouble >= rangeMaxPrice {
                viewModel.text = oldValue
            }
        })

        .onSubmit {
            guard let price = viewModel.text else { return }
            let priceDouble = Double(price)
            if priceDouble >= 0 && priceDouble < rangeMaxPrice {
                action(priceDouble)
            } else {
                viewModel.text = oldValue
            }
        }
    }
}
