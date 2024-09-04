//
//  File.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/09/2024.
//

import Foundation
import SwiftUI
final class TextFieldViewModel: ObservableObject {
    let cell: FilterViewModel.TextField
    let title: String
    @Published var text: String
    @Published private(set) var isTapped: Bool = false

    init(cell: FilterViewModel.TextField,
         title: String,
         text: String) {
        self.cell = cell
        self.title = title
        self.text = text
    }

    func updateIsTapped(with value: Bool) {
        if text.isEmpty {
            withAnimation(.easeOut) {
                isTapped = value
            }
        }
    }
}

extension TextFieldViewModel: Hashable {
    public static func == (lhs: TextFieldViewModel, rhs: TextFieldViewModel) -> Bool {
        return lhs.title == rhs.title
        && lhs.text == rhs.text
        && lhs.cell == rhs.cell
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(text)
        hasher.combine(cell)
    }
}
