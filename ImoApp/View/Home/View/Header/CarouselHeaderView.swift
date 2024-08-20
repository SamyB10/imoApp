//
//  CarouselHeaderView.swift
//  ImoApp
//
//  Created by Boussair Samy on 02/08/2024.
//

import SwiftUI

struct CarouselHeaderView: View {

    let title: String

    var body: some View {
        HStack(alignment: .bottom) {
            Text(title)
                .font(.title)
                .bold()

            Spacer()

//            if cleanFilter,
//               let action {
//                Button {
//                    action()
//                } label: {
//                    Image(systemName: "trash.circle")
//                        .resizable()
//                        .frame(width: 25, height: 25)
//                }
//            }
        }
    }
}

#Preview {
    CarouselHeaderView(title: "Header")
}
