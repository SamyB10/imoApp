//
//  File.swift
//  ImoApp
//
//  Created by Boussair Samy on 01/09/2024.
//

import Foundation
import SwiftUI

final class TextFieldViewModel: ObservableObject {
    let apperance: ApperanceTextField
    let prompt: String
    @Published var text: Int?


    init(apperance: ApperanceTextField,
         prompt: String,
         text: Int? = nil) {
        self.apperance = apperance
        self.prompt = prompt
        self.text = text
    }
}

extension TextFieldViewModel {
    enum ApperanceTextField {
        case price
        case areaSquareMeter
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

    var unity: String {
        switch apperance {
        case .price:
            "€"
        case .areaSquareMeter:
            "m2"
        case .localisation:
            "m"
        }
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
