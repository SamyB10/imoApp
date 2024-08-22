//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//
import SwiftUI
struct FilterHomeView: View {
    //    @StateObject var viewModel: FilterHomeViewModel
    @StateObject var manager: FilterViewManager

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ForEach(manager.viewModel.sections, id: \.self) { section in
                    switch section {
                    case .typeOfProperty(let cells):
                        Picker("Select an option", selection: $manager.selectedPickerCell) {
                            ForEach(cells, id: \.id) { cell in
                                switch cell.apperance {
                                case .pickerStyle(let apperance):
                                    Text(apperance.title)
                                        .tag(cell.id as UUID?)
                                default:
                                    Text("")
                                }
                            }
                        }

                        .pickerStyle(.segmented)
                        .padding()
                        .onChange(of: manager.selectedPickerCell, { oldValue, newValue in
                            print("Selected cell: \(String(describing: newValue))")
                        })
                        Spacer()
                    }
                }
            }
            .navigationTitle("Filter")
            .onAppear {
                manager.didLoad()
            }
        }
    }
}

    //                                    switch $0.apperance {
    //                                    case .pickerStyle(let apperance):
    //                                        Text(apperance.title)
    //                                            .tag($0.id)
    //                                    default:
    //                                        Text("")
    //                                    }

public struct FilterHomeViewModel: Equatable, Hashable {
    let sections: [Section]

    init() {
        // Initialisation des sections avec des cellules dont les UUID sont créés une seule fois
        self.sections = [
            Section.typeOfProperty([
                Section.Cell(id: UUID(), apperance: .pickerStyle(.apartment), currentState: true),
                Section.Cell(id: UUID(), apperance: .pickerStyle(.house), currentState: false)
            ])
        ]
    }
}

extension FilterHomeViewModel {
    enum Section: Hashable, Equatable {
        case typeOfProperty([Cell])
    }
}

//extension FilterHomeViewModel.Section {
//    var cells: [FilterHomeViewModel.Section.Cell] {
//        switch self {
//        case .typeOfProperty:
//            return [
//                FilterHomeViewModel.Section.Cell(apperance: .pickerStyle(.apartment),
//                                                 currentState: true),
//                FilterHomeViewModel.Section.Cell(apperance: .pickerStyle(.house),
//                                                 currentState: false)
//            ]
//        }
//    }
//}

extension FilterHomeViewModel.Section {
    struct Cell: Hashable {
        let id: UUID
        let apperance: Appearance
        let currentState: Bool
    }
}

extension FilterHomeViewModel.Section {
    enum Appearance: Equatable, Hashable {
        case pickerStyle(FilterHomePickerStyle)
        case toggle(FilterHomeToggle)
        case slideBar(FilterHomeSlideBar)
        case button(FilterHomeButton)
    }
}

enum FilterHomePickerStyle: Hashable {
    case apartment
    case house

    var title: String {
        switch self {
        case .apartment:
            "Appartement"
        case .house:
            "Maison"
        }
    }
}

enum FilterHomeToggle {
    case studio
    case oneRooms
    case twoRooms
    case threeRooms
    case fourRooms
    case fiveRoomsOrMore

    case groundFloor
    case firstFloor
    case secondFloorOrMore
}

enum FilterHomeSlideBar {
    case minimumPrice
    case maximunPrice
    case areaHouseMinimum
    case areaHouseMaximun
    case searchRadius
}

enum FilterHomeButton {
    case Lift
    case BalconyTerrace
    case Garden
    case CarPark
    case Cellar
    case new
    case renovated
    case old
}

extension FilterHomeViewModel {
    static var filterHomeViewModelSample: FilterHomeViewModel {
        FilterHomeViewModel()
    }
}
