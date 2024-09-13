//
//  CircleSlider.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/09/2024.
//

import SwiftUI


struct CircleSlider: View {
    var width: CGFloat

    var body: some View {
        Circle()
            .frame(width: width)
            .foregroundStyle(.white)
            .shadow(radius: 5)
    }
}
