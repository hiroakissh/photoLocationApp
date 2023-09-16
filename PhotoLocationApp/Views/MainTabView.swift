//
//  MainTabView.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import SwiftUI

struct MainTabView: View {

    @State private var activeTab: MainTab = .locationList
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab, content: {
                LocationListView(viewModel: LocationListViewModel(saveLocationRepository: saveLocationRepository()))
                    .tag(MainTab.locationList)
                AddLocationView(viewModel: AddLocationViewModel())
                    .tag(MainTab.addLocationTab)
                RecommendLocationView()
                    .tag(MainTab.recommendLocationTab)
            })

            CustomTabBar()
        }
    }

    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color("Blue"), _ inactiveTint: Color = .blue) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(MainTab.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabShapePosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            // 75
            // 195
            // 315
            TabShape(midPoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(
                    color: .black.opacity(0.2),
                    radius: 5,
                    x: 0,
                    y: -5
                )
                .blur(radius: 2)
                .padding(.top, 25)
        })
        .animation(
            .interactiveSpring(
                response: 0.6,
                dampingFraction: 0.7,
                blendDuration:  0.7
            ),
            value: activeTab
        )
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
