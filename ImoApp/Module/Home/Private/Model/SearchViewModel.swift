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
    private(set) var searchCompleter: MKLocalSearchCompleter
    var searchText = ""

    private(set) var selectedLocation: String? {
        didSet {
            guard selectedLocation != oldValue else { return }
        }
    }

    override init() {
        searchCompleter = MKLocalSearchCompleter()
        searchCompleter.resultTypes = .address
        super.init()
        searchCompleter.delegate = self
    }

    func search() {
        searchCompleter.queryFragment = searchText
    }

    func updateSelectedLocation(with location: String) {
        selectedLocation = location
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

