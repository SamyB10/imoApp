//
//  ToggleViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 28/08/2024.
//

import Foundation
import SwiftUI
final class ToggleViewModel: ObservableObject {
    let apperance: Apperance
    let title: String?
    @Published var isOn: Bool
    let theme: Color

    init(apperance: Apperance,
         title: String? = nil,
         isOn: Bool,
         theme: Color) {
        self.apperance = apperance
        self.title = title
        self.isOn = isOn
        self.theme = theme
    }

    enum Apperance {
        case `switch`
        case button
    }
}

extension ToggleViewModel: Hashable {
    public static func == (lhs: ToggleViewModel, rhs: ToggleViewModel) -> Bool {
        return lhs.title == rhs.title
        && lhs.isOn == rhs.isOn
        && lhs.apperance == rhs.apperance
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(isOn)
        hasher.combine(apperance)
    }
}

extension ToggleViewModel {
//    var color: Color {
//
//    }
}
