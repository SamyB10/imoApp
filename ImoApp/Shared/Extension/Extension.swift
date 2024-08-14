//
//  Extension.swift
//  ImoApp
//
//  Created by Boussair Samy on 14/08/2024.
//

import Foundation
import UIKit
import SwiftUI

extension Font {
    static func customTitleFont(size: CGFloat) -> Font {
        return Font.custom("AnticDidone-Regular", size: size)
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

// MARK: - Extension for swipe gesture back when navBar custom
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
