//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 19/09/2024.
//

import SwiftUI

struct DetailOverlayView: View {
    var body: some View {
        HStack {
            ImageLoaderView(dvImage: .asset("Avatar"),
                            contentMode: .fit)
            .frame(width: 30, height: 30)

            Text("Title a voir ")
                .foregroundStyle(.white)
                .bold()

            Spacer()

            Text("Virtual Tour")
                .foregroundStyle(.white)
                .bold()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal, 50)
    }
}

#Preview {
    DetailOverlayView()
}
