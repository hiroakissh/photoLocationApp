//
//  DetailLocationView.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2024/01/24.
//

import SwiftUI

struct DetailLocationView: View {
    var selectedLocation: SaveLocationSwiftModel

    var body: some View {
        Text(selectedLocation.name)
    }
}

#Preview {
    DetailLocationView(selectedLocation: SaveLocationModelSample().sampleData)
}
