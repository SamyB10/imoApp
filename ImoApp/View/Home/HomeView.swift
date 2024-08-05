//
//  CardView.swift
//  ImoApp
//
//  Created by Boussair Samy on 31/07/2024.
//


import SwiftUI

@MainActor
public protocol HomeDisplayLogic {
    func displayInterface()
}

struct HomeView: View {
    var homeInteractor: HomeBusinessLogic?
    @State private var navigateToNextPage = false

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    createSectionTrend
                }
            }
            .navigationTitle("Home")
            .background(.ultraThickMaterial)
        }
    }

    private var createSectionTrend: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                createItemCarousel
                    .scrollTargetLayout()
            }
            .contentMargins(.horizontal, hMargin)
            .scrollTargetBehavior(.paging)
        } header: {
            VStack(alignment: .leading) {
                CarouselHeaderView()
            }
            .padding()
        }
    }

    private var createItemCarousel: some View {
        LazyHStack(spacing: hSpacing) {
            ForEach(0...6, id: \.self) { _ in
//                NavigationLink(destination: Text("Detail Page")) {
                    CarouselView(viewModel: .viewModelTest)
//                }
            }
        }
    }

    var hMargin: CGFloat {
#if os(macOS)
        40.0
#else
        20.0
#endif
    }

    var hSpacing: CGFloat {
            10.0
        }
}

extension HomeView: HomeDisplayLogic {
    func displayInterface() {
        print("dis")
    }
}

#Preview {
    HomeView()
}
