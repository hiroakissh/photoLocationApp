//
//  SaveLocationSwiftModel.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import Foundation

class SaveLocationSwiftModel {
    let uuid: String
    let name: String
    let latitude: Double // 緯度
    let longitude: Double // 経度
    let saveDate: Date
    let idealCondition: IdealConditionSwiftModel

    init(
        uuid: String,
        name: String,
        latitude: Double,
        longitude: Double,
        saveDate: Date,
        idealCondition: IdealConditionSwiftModel
    ) {
        self.uuid = uuid
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.saveDate = saveDate
        self.idealCondition = idealCondition
    }
}
