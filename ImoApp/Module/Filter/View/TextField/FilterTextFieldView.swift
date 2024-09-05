//
//  FilterTextFiledView.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/09/2024.
//

import SwiftUI

struct TextFieldView: View {
    @ObservedObject private(set) var viewModel: TextFieldViewModel
    let action: (Double) -> Void
    @State private var showAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            TextField("", text: $viewModel.text, prompt: Text(viewModel.prompt))
                .font(.system(size: 13))
                .padding(5)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .keyboardType(.numbersAndPunctuation)
                .fixedSize()
                .overlay(
                    RoundedRectangle(cornerRadius: viewModel.cornerRadiusText)
                        .stroke(Color.black,
                                lineWidth: viewModel.lineWidth)
                )
        }

        .onSubmit {
            submit()
        }

        .alert(isPresented: $showAlert) {
            Alert(title: Text("Erreur de saisie")
                .font(.headline)
                .foregroundColor(.red),
                  message: Text("Veuillez entrer un nombre valide. Seuls les chiffres sont acceptés.")
                .font(.subheadline)
                .foregroundColor(.gray),
                  dismissButton: .default(Text("OK")))
        }
    }

    private func submit() {
        let cleanedText = viewModel.text
               .replacingOccurrences(of: " ", with: "")
               .replacingOccurrences(of: "€", with: "")

        guard let price = Int(cleanedText) else {
            showAlert = true
            return
        }
        action(Double(price))
    }
}
