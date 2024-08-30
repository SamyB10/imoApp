//
//  SectionStackedCard.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI

struct SectionStackedCard: View {
    private let header: HeaderViewModel
    private let items: [CardHomeViewModel]

    init(header: HeaderViewModel,
         items: [CardHomeViewModel]) {
        self.header = header
        self.items = items
    }

    var body: some View {
        Section {
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(items) { item in
                        createItemStackedCard(with: item)
                            .frame(width: UIScreen.main.bounds.width)
                            .visualEffect { content, geometryProxy in
                                content
                                    .scaleEffect(scale(geometryProxy, scale: 0.1), anchor: .trailing)
                                    .rotationEffect(rotation(geometryProxy))
                                    .offset(x: minX(geometryProxy))
                                    .offset(x: excessMinX(geometryProxy))
                            }
                            .zIndex(items.zIndex(item))
                    }
                }
                .padding(.bottom)
            }
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
        } header: {
            VStack(alignment: .leading) {
                SectionHeaderView(viewModel: header)
            }
            .padding(.horizontal)
        }
    }

    private func createItemStackedCard(with item: CardHomeViewModel) -> some View {
        StackedCardView(viewModel: item)
            .frame(height: 200)
            .padding(.trailing)
    }

    private func minX(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        return minX < 0 ? 0 : -minX
    }

    private func progress(_ proxy: GeometryProxy, limit: CGFloat = 2) -> CGFloat {
        let maxX = proxy.frame(in: .scrollView(axis: .horizontal)).maxX
        let width = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0

        let progress = (maxX / width) - 1.0
        let cappedProgress = Swift.min(progress, limit)

        return cappedProgress
    }

    private func scale(_ proxy: GeometryProxy, scale: CGFloat = 0.1) -> CGFloat {
        let progress = progress(proxy)

        return 1 - (progress * scale)
    }

    private func excessMinX(_ proxy: GeometryProxy, offset: CGFloat = 10) -> CGFloat {
        let progress = progress(proxy)

        return progress * offset
    }

    private func rotation(_ proxy: GeometryProxy, rotation: CGFloat = 0) -> Angle {
        let progress = progress(proxy)

        return .init(degrees: progress * rotation)
    }
}
