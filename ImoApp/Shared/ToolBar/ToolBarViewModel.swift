//
//  ApperanceToolBar.swift
//  ImoApp
//
//  Created by Boussair Samy on 26/09/2024.
//

import Foundation

struct ToolBarViewModel {
    let appearance: ApperanceToolBar

    enum ApperanceToolBar {
        case avatar
        case filter
        case all
    }
}

extension ToolBarViewModel {

    var avatar: String {
        "Avatar"
    }

    var imageFilterHome: String {
        "slider.horizontal.3"
    }

    var widthButton: CGFloat {
        30
    }

    var heightButton: CGFloat {
        30
    }
}


