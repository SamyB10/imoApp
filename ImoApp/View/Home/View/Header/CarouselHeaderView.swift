//
//  CarouselHeaderView.swift
//  ImoApp
//
//  Created by Boussair Samy on 02/08/2024.
//

import SwiftUI

struct CarouselHeaderView: View {
    @State var title: String
    var body: some View {
        Text(title)
            .font(.title)
            .bold()
    }
}

#Preview {
    CarouselHeaderView(title: "Title")
}
