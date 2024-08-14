//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI
struct CardView: View {
    private var randomInt = Int.random(in: 1...4)
    @State var viewModel: CardHomeViewModel

    init(randomInt: Int = Int.random(in: 1...4),
         viewModel: CardHomeViewModel) {
        self.randomInt = randomInt
        self.viewModel = viewModel
    }

    var body: some View {
        HStack(alignment: .top) {
            Image(viewModel.imageHouse)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(5)

            VStack(alignment: .leading) {
                Text(viewModel.titleHouse)
                    .font(.title)
                Text(viewModel.addressHouse)
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
    CardView(viewModel: .viewModelTest)
}
