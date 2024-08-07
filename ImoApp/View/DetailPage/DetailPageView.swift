//
//  DetailPageView.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/08/2024.
//

import SwiftUI

struct DetailPageView: View {
    @Environment(\.dismiss) private var dismiss: DismissAction
    @State private var detailOverlayMidY: CGFloat = 0
    var viewModel: DetailPageViewModel

    var body: some View {
        VStack {
            overlayImageHouse
        }
        .ignoresSafeArea()

        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image(systemName: "arrowshape.backward.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.5)
                }
            }
        }
    }

    private var detailOverlay: some View {
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

    private var overlayImageHouse: some View {
        VStack(spacing: 50) {
            imageHouseDetail
                .overlay(alignment: .bottom) {
                    detailOverlay
                        .offset(y: detailOverlayMidY)
                        .background(
                            GeometryReader { geometry in
                                Color.clear
                                    .onAppear {
                                        detailOverlayMidY = geometry.frame(in: .local).midY
                                    }
                            })
                }

            ScrollView {
                DescriptionDetailPageView()
            }

        }
    }

    private var imageHouseDetail: some View {
        ImageLoaderView(dvImage: .asset(viewModel.image),
                        ratio: 4 / 3,
                        contentMode: .fit)
        //        .frame(width: .infinity, height: 350)
        .ignoresSafeArea()
    }
}

#Preview {
    DetailPageView(viewModel: .sampleViewModel)
}
