//
//  ConvertRealmToSwift.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/14.
//

import Foundation
import RealmSwift

extension SaveLocationRealmModel {
    func convertToSwiftModel() -> SaveLocationSwiftModel {
        let swiftModel = SaveLocationSwiftModel(
            uuid: self.uuid,
            name: self.name,
            latitude: self.latitude,
            longitude: self.longitude,
            saveDate: self.saveDate,
            idealCondition: self.idealCondition?.convertToSwiftModel()
        )
        return swiftModel
    }
}

extension IdealConditionRealmModel {
    func convertToSwiftModel() -> IdealConditionSwiftModel {
        let swiftModel = IdealConditionSwiftModel(
            idealMonth: self.idealMonth,
            idealTime: self.idealTime,
            idealWeather: self.idealWeather
        )
        return swiftModel
    }
}
