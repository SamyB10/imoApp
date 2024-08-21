//
//  SearchViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 19/08/2024.
//

import Foundation
import MapKit
class SearchLocationViewModel: NSObject, ObservableObject {
    @Published private(set) var suggestions: [MKLocalSearchCompletion] = []
    @Published var searchText = "" {
        didSet {
            guard searchText.isEmpty else { return }
            suggestions = []
        }
    }

    var locationChoice: String? {
        didSet {
            guard locationChoice != oldValue else { return }
        }
    }

    private(set) var searchCompleter: MKLocalSearchCompleter
    private(set) var findLocation: Bool = false

    override init() {
        searchCompleter = MKLocalSearchCompleter()
        searchCompleter.resultTypes = .address
        super.init()
        searchCompleter.delegate = self
    }

    func search() {
        searchCompleter.queryFragment = searchText
    }

    func finishSearch() {
        guard !suggestions.contains(where: { suggestion in
            searchText == suggestion.title
        }) else {
            return findLocation = true
        }
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

