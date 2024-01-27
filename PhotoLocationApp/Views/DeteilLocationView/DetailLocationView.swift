//
//  DetailLocationView.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2024/01/24.
//

import SwiftUI
import MapKit

struct DetailLocationView: View {
    var selectedLocation: SaveLocationSwiftModel

    var body: some View {
        Text(selectedLocation.name)
        // TODO: Mapで位置情報を表示
        // TODO: Conditionがあれば、それを表示する
        // TODO: もし画像が表示できることがあれば、表示できるようにするのを考える
        Map(
            initialPosition: .region(
                .init(
                    center: .init(
                        latitude: selectedLocation.latitude,
                        longitude: selectedLocation.longitude
                    ),
                    span: .init()
                )
            )
        )
        {
            Annotation(
                coordinate: .init(
                    latitude: selectedLocation.latitude,
                    longitude: selectedLocation.longitude
                )) {
                    VStack{
                        Button {
                            print("Selected Button")
                        } label: {
                            Text("view Photo")
                        }
                    }
                    .foregroundColor(.blue)
                    .padding()
                    .background(in: .capsule)
                } label: {
                    Text(selectedLocation.name)
                }

        }
    }
}

#Preview {
    DetailLocationView(selectedLocation: SaveLocationModelSample().sampleData)
}
