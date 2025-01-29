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
            .frame(width: 20, height: 20)

            VStack(alignment: .leading) {
                Text("Title a voir ")
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text("Title a voir ")
                    .font(.system(size: 11))
                    .fontWeight(.light)
                    .foregroundStyle(.white)

            }

            Spacer()

            HStack(spacing: 10) {
                ImageLoaderView(dvImage: .systemName("phone"), contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                Rectangle()
                    .foregroundStyle(.white)
                    .frame(width: 1, height: 20)
                ImageLoaderView(dvImage: .systemName("envelope"), contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
            }

            Spacer()

            Text("Virtual Tour")
                .font(.system(size: 13))
                .foregroundStyle(.white)
                .bold()
            ImageLoaderView(dvImage: .systemName("cube.transparent"), contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)

        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal, 40)
    }
}

#Preview {
    DetailOverlayView()
        .background(Color.black)
}
