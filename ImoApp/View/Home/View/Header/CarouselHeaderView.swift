//
//  CarouselHeaderView.swift
//  ImoApp
//
//  Created by Boussair Samy on 02/08/2024.
//

import SwiftUI

struct CarouselHeaderView: View {
    let cleanFilter: Bool
    let title: String
    let action: (() -> Void)?

    init(cleanFilter: Bool = false,
         title: String,
         action: (() -> Void)? = nil) {
        self.cleanFilter = cleanFilter
        self.title = title
        self.action = action
    }

    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.title)
                .bold()

            Spacer()

            if cleanFilter,
               let action{
                Button {
                    action()
                } label: {
                    Image(systemName: "trash.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
        }
    }
}

#Preview {
    CarouselHeaderView(title: "Header")
}
