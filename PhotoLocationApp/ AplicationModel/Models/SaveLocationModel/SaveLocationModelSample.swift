//
//  SaveLocationModelSample.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2024/01/26.
//

import Foundation

struct SaveLocationModelSample {
    let sampleData = SaveLocationSwiftModel(
        name: "SampleTest",
        latitude: 35.6894,
        longitude: 139.6917,
        saveDate: Date(),
        idealCondition: .init(
            idealMonth: 1,
            idealTime: 1,
            idealWeather: "sunny"
        )
    )

    let nonInitialSampleData = SaveLocationSwiftModel(
        name: "SampleTest",
        latitude: 35.6894,
        longitude: 139.6917,
        saveDate: Date(),
        idealCondition: nil
    )
}
