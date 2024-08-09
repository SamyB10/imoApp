//
//  HouseItemView.swift
//  ImoApp
//
//  Created by Boussair Samy on 08/08/2024.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

struct Item: Identifiable {
    let id: UUID = .init()
    let color: Color
}

//
var items: [Item] =
    [
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
        Item(color: Color.random),
    ]


extension [CardHomeViewModel] {
    func zIndex(_ item: CardHomeViewModel) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }

        return .zero
    }
}

extension [Item] {
    func zIndex(_ item: Item) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }

        return .zero
    }
}

    struct HouseCardItemView: View {
        var body: some View {
            GeometryReader {
                let size = $0.size
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(items) { item in
                            cardView()
                                .padding(.horizontal)
                                .frame(width: size.width)
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
                }
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
            }
        }


    func cardView() -> some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.random)
    }

    func minX(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        return minX < 0 ? 0 : -minX
    }

    func progress(_ proxy: GeometryProxy, limit: CGFloat = 2) -> CGFloat {
        let maxX = proxy.frame(in: .scrollView(axis: .horizontal)).maxX
        let width = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0

        let progress = (maxX / width) - 1.0
        let cappedProgress = Swift.min(progress, limit)

        return cappedProgress
    }

    func scale(_ proxy: GeometryProxy, scale: CGFloat = 0.1) -> CGFloat {
        let progress = progress(proxy)

        return 1 - (progress * scale)
    }

    func excessMinX(_ proxy: GeometryProxy, offset: CGFloat = 10) -> CGFloat {
        let progress = progress(proxy)

        return progress * offset
    }

    func rotation(_ proxy: GeometryProxy, rotation: CGFloat = 0) -> Angle {
        let progress = progress(proxy)

        return .init(degrees: progress * rotation)
    }
}

#Preview {
    HouseCardItemView()
}
