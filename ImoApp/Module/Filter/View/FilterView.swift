//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//
import SwiftUI
struct FilterView: View {
    @ObservedObject var manager: FilterViewManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    if let viewModel = manager.viewModel {
                        ForEach(viewModel.sections, id: \.self) { section in
                            FilterSectionView(section: section) {
                                manager.didSelectItem(with: $0)
                            }
                        }
                        Spacer()
                    }
                }
                .padding()
                .navigationTitle("Filter")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    manager.didLoad()
                }
            }
        }
    }
}

#Preview {
    FilterView(manager: FilterViewManager(interacor: FilterInteractor()))
}
