//
//  FilterTextFiledView.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/09/2024.
//

import SwiftUI

struct FilterTextFiledView: View {
    var cell: FilterViewModel.TextField
    let action: (SelectedFilterItem) -> Void

    var body: some View {
        HStack {
            VStack {
                TextFieldView(viewModel: cell.viewModel) {
                    action($0)
                }
            }
        }
    }
}


struct TextFieldView: View {
    @ObservedObject private(set) var viewModel: TextFieldViewModel
    let action: (SelectedFilterItem) -> Void
    @State private var showAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            TextField("", text: $viewModel.text, prompt: Text(viewModel.title))
                .keyboardType(.numbersAndPunctuation)
                .padding(.top)
        }
        .overlay(alignment: .bottom) {
            borderBottom
        }
        .onSubmit {
            submit()
        }

        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"),
                  message: Text("Insérer un chiffre correct"),
                  dismissButton: .cancel())
        }
    }

    private var borderBottom: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color.black)

    }

    private func submit() {
        let cleanedText = viewModel.text.replacingOccurrences(of: " ", with: "")
        guard let price = Double(cleanedText) else {
            showAlert = true
            return
        }
        action(viewModel.cell.selectedItem(with: price))
    }
}
