//
//  SearchView.swift
//  ImoApp
//
//  Created by Boussair Samy on 20/08/2024.
//

import SwiftUI
struct SearchSuggestionView: View {

    @Environment(\.dismissSearch) private var dismissSearch
    @Environment(\.isSearching) private var isSearching
    var searchLocationViewModel: SearchLocationViewModel


    var body: some View {

        if !searchLocationViewModel.searchText.isEmpty {
            List {
                ForEach(searchLocationViewModel.suggestions, id: \.self) { suggestion in
                    Text(suggestion.title)
                        .foregroundStyle(.black)
                        .searchCompletion(suggestion.title)
                        .onTapGesture {
                            searchLocationViewModel.updateSelectedLocation(with: suggestion.title)
                            dismissSearch()
                        }
                }
            }
        } else {
            Color.black
                .opacity(isSearching ? 0.3 : 0)
                .allowsHitTesting(false)
        }
    }
}
