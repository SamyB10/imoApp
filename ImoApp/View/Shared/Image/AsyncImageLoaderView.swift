//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/08/2024.
//

import SwiftUI
import Kingfisher

// Due to support of iOS/macCatalyst 14, we can't always use SwiftUI.AsyncImage
// Remove this implementation once the min iOS/Catalyst version is equal or greater than 15
public struct AsyncImageLoaderView: View {
    private let url: URL?

    @State private var currentImageDownloadTask: Kingfisher.DownloadTask? {
        willSet { currentImageDownloadTask?.cancel() }
    }
    @State private var loadedImage: KFCrossPlatformImage?

    public init(url: URL?) {
        self.url = url
    }

    public var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: url) { imagePhase in
                if let image = imagePhase.image {
                    image
                        .resizable()
                }
            }
        } else {
            if let loadedImage {
                Image(uiImage: loadedImage)
                    .resizable()
            } else {
                Color.clear
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }

    private func loadImage() {
        if let url {
            let kingfisherManager = KingfisherManager.shared
            currentImageDownloadTask = kingfisherManager.retrieveImage(with: url) { result in
                switch result {
                case .success(let value):
                    self.loadedImage = value.image
                default:
                    break
                }
            }
        }
    }
}

