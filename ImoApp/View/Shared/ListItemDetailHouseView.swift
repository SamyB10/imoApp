//
//  ListItemDetailHouseView.swift
//  ImoApp
//
//  Created by Boussair Samy on 07/08/2024.
//

import SwiftUI

struct ListItemDetailHouseView: View {
    @State var viewModelItem: [ItemDetail]

    var body: some View {
        HStack {
            ForEach(viewModelItem, id: \.self) { item in
                switch item {
                case .numberOfRoom(let numberOfRoom):
                    createItemDetailHouse(with: numberOfRoom, image: "bed.double")
                case .numberOfbathRoom(let numberOfbathRoom):
                    createItemDetailHouse(with: numberOfbathRoom, image: "shower")
                case .surface(let surface):
                    createItemDetailHouse(with: surface, image: "house")
                }
            }
        }
        .padding(.trailing, UIScreen.main.bounds.width / 4)
    }

    private func createItemDetailHouse(with text: String, image: String)-> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray)
                .foregroundStyle(.clear)
                .frame(height: 30)
            HStack {
                Image(systemName: image)
                Text("\(text)")
                    .font(.footnote)
                    .bold()
            }
        }
    }
}

#Preview {
    ListItemDetailHouseView(viewModelItem: ItemDetailHouse.itemViewModelTest)
}
