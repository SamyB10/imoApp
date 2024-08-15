//
//  GabaritListViewModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 13/08/2024.
//






import Foundation
public class GabaritListViewModel: Equatable, ObservableObject {
    public static func == (lhs: GabaritListViewModel, rhs: GabaritListViewModel) -> Bool {
        lhs.items == rhs.items
    }
    
    let items: [ItemGabaritList]

    init(items: [ItemGabaritList]) {
        self.items = items
    }

    struct ItemGabaritList: Equatable, Hashable, Identifiable {
        let id: String
        let type: GabaritListType
        let keyDepartment: String?
        let keyRegion: String?
        let postalCode: String?

        init(id: String,
             type: GabaritListType,
             keyDepartment: String? = nil,
             keyRegion: String? = nil,
             postalCode: String? = nil) {
            self.id = id
            self.type = type
            self.keyDepartment = keyDepartment
            self.keyRegion = keyRegion
            self.postalCode = postalCode
        }
    }

    enum GabaritListType: Equatable, Hashable {
        case regions(String, String)
        case department(String, String)
        case city(String, String)
    }
}

// MARK: - TODO Upgrade
extension GabaritListViewModel {
    var numberItemDisplay: Int {
        if items.count > 2 {
            return 3
        } else {
            return items.count
        }

    }
}

extension GabaritListViewModel {
    static var viewModel: GabaritListViewModel {
        var items: [ItemGabaritList] = []
        for i in 1...12 {
            items.append(ItemGabaritList(id: UUID().uuidString,
                                         type: .regions("\(i)", "String")))
        }

        return GabaritListViewModel(items: items)
    }
}
