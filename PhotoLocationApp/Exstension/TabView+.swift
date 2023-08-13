//
//  TabView+.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import Foundation
import SwiftUI

extension MainTabView {
    enum SelectionType: String, Identifiable, CaseIterable {
        case locationList = "LocationList"
        case addLocation = "AddLocation"
        case recommendLocation = "recommendLocation"

        var id: String {
            return rawValue
        }
    }
}
