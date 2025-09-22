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
    private var viewModel: DetailPageViewModel

    init(viewModel: DetailPageViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        if #available(iOS 18.0, *) {
            VStack(spacing: 50) {
                overlayImageHouse
                ScrollView {
                    DescriptionDetailPageView()
                    ScrollView(.horizontal) {
                        VStack(alignment: .leading) {
                            Section {
                                HStack {
                                    ForEach(0..<10) {_ in
                                        Image(viewModel.image)
                                            .resizable()
                                            .cornerRadius(10)
                                            .frame(width: 120, height: 120)
                                            .padding(.bottom, 100)
                                    }
                                }
                            } header: {
                                Text("Galery")
                                    .font(.title)
                                    .foregroundStyle(.black)
                            }
                        }
                        .padding()
                    }
                }
            }
            
            .ignoresSafeArea()
        } else {
            VStack(spacing: 50) {
                overlayImageHouse
                ScrollView {
                    DescriptionDetailPageView()
                    ScrollView(.horizontal) {
                        VStack(alignment: .leading) {
                            Section {
                                HStack {
                                    ForEach(0..<10) {_ in
                                        Color.blue
                                            .cornerRadius(10)
                                            .frame(width: 120, height: 120)
                                    }
                                }
                            } header: {
                                Text("Galery")
                                    .font(.title)
                                    .foregroundStyle(.black)
                            }
                        }
                        .padding()
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)

            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    backButton
                }
            }
        }
    }

    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            ImageLoaderView(dvImage: .systemName("arrow.left.circle.fill"),
                            contentMode: .fill)
            .frame(width: 30, height: 30)
            .foregroundStyle(.white)
        }
    }

    private var overlayImageHouse: some View {
        imageHouseDetail
            .overlay(alignment: .bottom) {
                DetailOverlayView()
                    .offset(y: detailOverlayMidY)
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .onAppear {
                                    detailOverlayMidY = geometry.frame(in: .local).midY
                                }
                        })
            }
    }

    private var imageHouseDetail: some View {
        ImageLoaderView(dvImage: .asset(viewModel.image),
                        ratio: 4 / 3,
                        contentMode: .fit)
        .ignoresSafeArea()
    }
}

#Preview {
    DetailPageView(viewModel: .sampleViewModel)
}
