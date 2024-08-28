//
//  ToggleViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 28/08/2024.
//

import Foundation
import SwiftUI

final class ToggleViewModel: ObservableObject {
    let title: String?
    @Published var isOn: Bool

    init(title: String? = nil,
         isOn: Bool) {
        self.title = title
        self.isOn = isOn
    }
}

extension ToggleViewModel: Hashable {
    public static func == (lhs: ToggleViewModel, rhs: ToggleViewModel) -> Bool {
        return lhs.title == rhs.title
        && lhs.isOn == rhs.isOn
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(isOn)
    }
}

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
            Toggle(isOn: $viewModel.isOn) {
                if let title = viewModel.title {
                    Text(title)
                }
            }
            .tint(.blue)
            .onChange(of: viewModel.isOn) { oldValue, newValue in
                if let action = action {
                    action()
                }
            }
        }
    }
}
