//
//  MainTabView.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("1")
                .tabItem {
                    Text("1")
                }
            Text("2")
                .tabItem {
                    Text("2")
                }
            Text("3")
                .tabItem {
                    Text("3")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
