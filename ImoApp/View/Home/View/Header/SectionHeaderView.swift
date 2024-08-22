//
//  CarouselHeaderView.swift
//  ImoApp
//
//  Created by Boussair Samy on 02/08/2024.
//

import SwiftUI

struct SectionHeaderView: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }

    var body: some View {
        HStack(alignment: .bottom) {
            Text(title)
                .font(.title)
                .bold()

            Spacer()
        }
    }
}

#Preview {
    SectionHeaderView(title: "Header")
}
