//
//  TabModel.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/09/16.
//

import SwiftUI

enum MainTab: String, CaseIterable {
    case locationList = "LocationListTab"
    case addLocationTab = "AddLocationTab"
    case recommendLocationTab = "RecommendLocationTab"

    var systemImage: String {
        switch self {
        case .locationList:
            return "list.bullet"
        case .addLocationTab:
            return "plus.app"
        case .recommendLocationTab:
            return "info.circle"
        }
    }

    var index: Int {
        return MainTab.allCases.firstIndex(of: self) ?? 0
    }
}
