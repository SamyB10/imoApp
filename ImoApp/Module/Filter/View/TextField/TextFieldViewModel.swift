//
//  File.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/09/2024.
//

import Foundation
import SwiftUI
final class TextFieldViewModel: ObservableObject {
    let prompt: String
    @Published var text: Int

    init(prompt: String,
         text: Int) {
        self.prompt = prompt
        self.text = text
    }
}

extension TextFieldViewModel {
    enum Apperance {
        case minPrice
        case maxPrice
        case localisation
    }
}

extension TextFieldViewModel {
    var cornerRadiusText: CGFloat {
        10
    }

    var lineWidth: CGFloat {
        0.5
    }
}

extension TextFieldViewModel: Hashable {
    public static func == (lhs: TextFieldViewModel, rhs: TextFieldViewModel) -> Bool {
        return lhs.prompt == rhs.prompt
        && lhs.text == rhs.text
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(prompt)
        hasher.combine(text)
    }
}
