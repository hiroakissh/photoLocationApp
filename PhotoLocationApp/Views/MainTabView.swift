//
//  MainTabView.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import SwiftUI

struct MainTabView: View {

    @State private var selectionType: SelectionType = .locationList


    var body: some View {
        TabView(selection: $selectionType, content: {
            LocationListView()
                .tabItem {
                    Text("List")
                }
                .tag(SelectionType.locationList)
            AddLocationView()
                .tabItem {
                    Text("Add")
                }
                .tag(SelectionType.addLocation)
            RecommendLocationView()
                .tabItem {
                    Text("recommend")
                }
                .tag(SelectionType.recommendLocation)
        })
        .onChange(of: selectionType) { type in
            switch type {
            case .locationList:
                print("locationList")
            case .addLocation:
                print("addLocation")
            case .recommendLocation:
                print("recommendLocation")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
