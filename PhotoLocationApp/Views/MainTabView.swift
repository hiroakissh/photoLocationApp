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
            LocationListView(viewModel: LocationListViewModel())
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text(LocalizedStringKey(String("LocationListTab")))
                }
                .tag(SelectionType.locationList)
            AddLocationView(viewModel: AddLocationViewModel())
                .tabItem {
                    Image(systemName: "plus.app")
                    Text(LocalizedStringKey(String("AddLocationTab")))
                }
                .tag(SelectionType.addLocation)
            RecommendLocationView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text(LocalizedStringKey(String("RecommendLocationTab")))
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
