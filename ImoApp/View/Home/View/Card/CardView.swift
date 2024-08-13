//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI
struct CardView: View {
    private var randomInt = Int.random(in: 1...4)

    init(randomInt: Int = Int.random(in: 1...4)) {
        self.randomInt = randomInt
    }

    var body: some View {
        HStack(alignment: .top) {
            Image(String(randomInt))
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(5)

            VStack(alignment: .leading) {
                Text("Title")
                    .font(.title)
                Text("Description")
                    .font(.caption)
            }
            .padding(.top, 5)
            Spacer()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 10)
        .padding(.vertical, 5)

    }
}

#Preview {
    CardView()
}
