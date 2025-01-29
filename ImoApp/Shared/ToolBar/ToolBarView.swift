//
//  ToolBarCustom.swift
//  ImoApp
//
//  Created by Boussair Samy on 19/08/2024.
//

import SwiftUI
struct ToolBarView: View {
    let viewModel: ToolBarViewModel
    @State private var showSheet = false

    var body: some View {
        Color.clear
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        switch viewModel.appearance {
                        case .filter:
                            Button {
                                showSheet = true
                            } label: {
                                Image(systemName: viewModel.imageFilterHome)
                                    .foregroundStyle(.black)
                                    .frame(width: viewModel.widthButton, height: viewModel.heightButton)
                            }
                        case .avatar:
                            ImageLoaderView(dvImage: .asset(viewModel.avatar),
                                            contentMode: .fit)
                            .frame(width: viewModel.widthButton, height: viewModel.heightButton)
                        case .all:
                            Button {
                                showSheet = true
                            } label: {
                                Image(systemName: viewModel.imageFilterHome)
                                    .foregroundStyle(.black)
                                    .frame(width: viewModel.widthButton, height: viewModel.heightButton)
                            }

                            Spacer()

                            ImageLoaderView(dvImage: .asset(viewModel.avatar),
                                            contentMode: .fit)
                            .frame(width: viewModel.widthButton, height: viewModel.heightButton)
                        }
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                Navigation.navigationToFilter()
            }
    }
}

#Preview {
    ToolBarView(viewModel: ToolBarViewModel(appearance: .all))
}
