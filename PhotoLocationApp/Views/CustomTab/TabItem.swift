//
//  TabItem.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/09/17.
//

import SwiftUI

struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: MainTab
    var animation: Namespace.ID
    @Binding var activeTab: MainTab
    @Binding var position: CGPoint

    @State private var tabPosition: CGPoint = .zero
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : .black)
                .frame(
                    width: activeTab == tab ? 58 : 35,
                    height: activeTab == tab ? 58 : 35
                )
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill()
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }

            Text(LocalizedStringKey(String(tab.rawValue)))
                .font(.caption)
                .foregroundColor(activeTab == tab ? .black : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab

            withAnimation(
                .interactiveSpring(
                    response: 0.6,
                    dampingFraction: 0.7,
                    blendDuration: 0.7
                )
            ) {
                position.x = tabPosition.x
            }
        }
    }
}
