//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/08/2024.
//
import SwiftUI
public struct AsyncImageLoaderView: View {
    private let url: URL?

    public init(url: URL?) {
        self.url = url
    }

    public var body: some View {
        AsyncImage(url: url) { imagePhase in
            if let image = imagePhase.image {
                image
                    .resizable()
            }
        }
    }
}
