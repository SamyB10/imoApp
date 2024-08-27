//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//
import SwiftUI
struct FilterView: View {
    @StateObject var manager: FilterViewManager
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                if let viewModel = manager.viewModel {
                    FilterSectionView(sections: viewModel.sections) {
                        manager.didSelectItem(with: $0)
                    }
                    Spacer()
                }
            }
            .navigationTitle("Filter")
            .onAppear {
                manager.didLoad()
            }
        }
    }
}
