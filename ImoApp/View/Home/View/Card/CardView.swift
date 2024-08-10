//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI

struct CardView: View {
    private var randomInt = Int.random(in: 1...4)
    private var height: CGFloat
    private var width: CGFloat

    init(randomInt: Int = Int.random(in: 1...4),
         height: CGFloat,
         width: CGFloat) {
        self.randomInt = randomInt
        self.height = height
        self.width = width
    }
    var body: some View {
        Image(String(randomInt))
            .resizable()
            .frame(width: width, height: height)
    }
}
