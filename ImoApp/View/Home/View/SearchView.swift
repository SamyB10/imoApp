//
//  SearchView.swift
//  ImoApp
//
//  Created by Boussair Samy on 20/08/2024.
//

import SwiftUI

//struct SearchingExample: View {
//    @State private var searchText = ""
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.blue
//                SearchedView(searchText: searchText)
//                    .searchable(text: $searchText)
//            }
//        }
//    }
//}
//
//#Preview {
//    SearchingExample()
//}


struct SearchedView: View {

    @Environment(\.dismissSearch) private var dismissSearch
    var searchLocationViewModel: SearchLocationViewModel


    var body: some View {

        if !searchLocationViewModel.searchText.isEmpty {
            List {
                ForEach(searchLocationViewModel.suggestions, id: \.self) { suggestion in
                    Text(suggestion.title)
                        .foregroundStyle(.black)
                        .searchCompletion(suggestion.title)
                        .onTapGesture {
                            searchLocationViewModel.locationChoice = suggestion.title
                            dismissSearch()
                        }
                }
            }
        }
    }
}
