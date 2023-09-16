//
//  AddButtonPresseView.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/09/03.
//

import Foundation
import SwiftUI

struct AddButtonPresseView: View {
    @Binding var isDetailViewVisible: Bool

    var body: some View {
        VStack {
            Text("Saved!")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()

            Button(action: {
                withAnimation {
                    isDetailViewVisible.toggle() // 詳細ビューを非表示にする
                }
            }) {
                Text("OK")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
