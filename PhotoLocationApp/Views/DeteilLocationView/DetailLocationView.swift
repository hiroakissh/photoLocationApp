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
                    span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05)
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
                        Button(action: {
                            print("経路案内")
                        }, label: {
                            Text("経路案内")
                        })
                        .foregroundStyle(.white)
                        .background(.blue)
                        if let idealCondition = selectedLocation.idealCondition {
                            if let idealMonth = idealCondition.idealMonth {
                                Text("理想月：\(String(idealMonth)) 月")
                            }
                            if let idealTime = idealCondition.idealTime {
                                Text("理想時間：\(String(idealTime)) 時")
                            }
                            if let idealWeather = idealCondition.idealWeather {
                                Text("理想天気：\(idealWeather)")
                            }
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
