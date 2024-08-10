//
//  ImageView.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/08/2024.
//

import SwiftUI
import UIKit

public enum DVImage: Hashable, Sendable {
    case urlString(String)
    case asset(String)
}

public struct ImageLoaderView: View {
    private let dvImage: DVImage
    private let ratio: Double?
    private let cornerRadius: CGFloat
    private let contentMode: ContentMode

    public init(dvImage: DVImage,
                ratio: Double? = nil,
                cornerRadius: CGFloat = 0,
                contentMode: ContentMode) {
        self.dvImage = dvImage
        self.ratio = ratio
        self.cornerRadius = cornerRadius
        self.contentMode = contentMode
    }

    public var body: some View {
        switch dvImage {
        case .urlString(let urlString):
            let url = urlString
            if let ratio {
                AsyncImageLoaderView(url: URL(string: url))
                    .cornerRadius(cornerRadius)
                    .aspectRatio(ratio, contentMode: contentMode)
            } else {
                AsyncImageLoaderView(url: URL(string: url))
                    .cornerRadius(cornerRadius)
                    .aspectRatio(contentMode: contentMode)
            }
        case .asset(let imageAsset):
            if let ratio {
                Image(imageAsset)
                    .resizable()
                    .cornerRadius(cornerRadius)
                    .aspectRatio(ratio, contentMode: contentMode)
            } else {
                Image(imageAsset)
                    .resizable()
                    .cornerRadius(cornerRadius)
                    .aspectRatio(contentMode: contentMode)
            }
        }
    }
}
