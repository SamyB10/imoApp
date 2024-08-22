//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//
import SwiftUI
struct FilterHomeView: View {
    @StateObject var viewModel: FilterHomeViewModel
//    @StateObject var viewModel: FilterViewManager

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ForEach(viewModel.sections, id: \.self) { section in
                    switch section {
                    case .typeOfProperty:
//                        Form {
                            Picker("", selection: $viewModel.selectedCell) {
                                ForEach(section.cells, id: \.self) {
                                    switch $0.apperance {
                                    case .pickerStyle(let apperance):
                                        Text(apperance.title)
                                            .tag($0 as FilterHomeViewModel.Section.Cell?)
                                    default:
                                        Text("")
                                    }
                                }
                            }
                            .pickerStyle(.segmented)
                            .padding()
                        Spacer()
//                        }
                    }
                }
            }
            .navigationTitle("Filter")
        }
    }
}

#Preview {
    FilterHomeView(viewModel: .filterHomeViewModelSample)
}


class FilterHomeViewModel: ObservableObject {
    @Published var selectedCell: FilterHomeViewModel.Section.Cell?
    let sections: [Section]

    init(sections: [Section]) {
        self.sections = sections
    }
}


//struct FilterHomeViewModel: Equatable {
//    let sections: [Section]
//}

extension FilterHomeViewModel {
    enum Section {
        case typeOfProperty
    }
}

extension FilterHomeViewModel.Section {
    var cells: [FilterHomeViewModel.Section.Cell] {
        switch self {
        case .typeOfProperty:
            return [
                FilterHomeViewModel.Section.Cell(apperance: .pickerStyle(.apartment),
                                                 currentState: true),
                FilterHomeViewModel.Section.Cell(apperance: .pickerStyle(.house),
                                                 currentState: false)
            ]
        }
    }
}

extension FilterHomeViewModel.Section {
    struct Cell: Hashable {
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

enum FilterHomePickerStyle {
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
        FilterHomeViewModel(sections: [.typeOfProperty])
    }
}
