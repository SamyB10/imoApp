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
                .frame(width: 130, height: 130)
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
    }
}

#Preview {
    CardView(viewModel: .viewModelTest)
}

struct CardViewTest: View {
    private var randomInt = Int.random(in: 1...4)
    @State var viewModel: CardHomeViewModel

    init(randomInt: Int = Int.random(in: 1...4),
         viewModel: CardHomeViewModel) {
        self.randomInt = randomInt
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            Image(viewModel.imageHouse)
                .resizable()
                .aspectRatio(21/9, contentMode: .fill)
                .cornerRadius(10)

            detailHouse
        }
        .background(Color.white)
        .cornerRadius(10)
    }

    @ViewBuilder
    private var detailHouse: some View {
        VStack(alignment: .leading,
               spacing: 20) {
            Text(viewModel.titleHouse)
                .font(.customTitleFont(size: 22))
                .foregroundColor(.black)
            
            Text(viewModel.addressHouse)
                .foregroundColor(.black)
            
            ListItemDetailHouseView(viewModelItem: ItemDetailHouse.itemViewModelTest)
        }
               .padding()
    }
}

//
//        HStack(alignment: .top) {
//            Image(viewModel.imageHouse)
//                .resizable()
//                .frame(width: 130, height: 130)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .padding(5)
//
//            VStack(alignment: .leading) {
//                Text(viewModel.titleHouse)
//                    .font(.title)
//                Text(viewModel.addressHouse)
//                    .font(.caption)
//            }
//            .padding(.top, 5)
//            Spacer()
//        }
//        .background(.ultraThinMaterial)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .padding(.horizontal, 10)
//    }


#Preview {
    CardViewTest(viewModel: .viewModelTest)
}

