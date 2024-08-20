//
//  SearchViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 19/08/2024.
//

import Foundation
import MapKit
class SearchLocationViewModel: NSObject, ObservableObject {
    @Published var suggestions: [MKLocalSearchCompletion] = []
    @Published var searchText = ""

    private var searchCompleter: MKLocalSearchCompleter

    override init() {
        searchCompleter = MKLocalSearchCompleter()
        searchCompleter.resultTypes = .address
        super.init()
        searchCompleter.delegate = self
    }

    func search() {
        searchCompleter.queryFragment = searchText
    }
}

extension SearchLocationViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.suggestions = completer.results
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Error completing search: \(error.localizedDescription)")
    }
}









//public enum TypeLocationSearchable: Equatable, Hashable {
//    case region
//    case department
//    case city
//}
//
//struct SearchLocationViewModel: Equatable, Hashable {
//    let itemsSearchable: [TypeLocationSearchable: [ItemSearchableLocation]]
//
//    struct ItemSearchableLocation: Equatable, Hashable {
//        let id: String
//        let name: String
//    }
//}
//
