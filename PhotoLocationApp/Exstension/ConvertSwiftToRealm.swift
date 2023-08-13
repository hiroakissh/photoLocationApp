//
//  ConvertSwiftToRealm.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/14.
//

import Foundation
import RealmSwift

extension SaveLocationSwiftModel {
    func convertToRealmModel() -> SaveLocationRealmModel {
        let realmModel = SaveLocationRealmModel()
        realmModel.uuid = self.uuid
        realmModel.name = self.name
        realmModel.saveDate = self.saveDate
        realmModel.longitude = self.longitude
        realmModel.latitude = self.latitude
        realmModel.idealCondition = self.idealCondition?.convertToRealmModel()
        return realmModel
    }
}

extension IdealConditionSwiftModel {
    func convertToRealmModel() -> IdealConditionRealmModel {
        let realmModel = IdealConditionRealmModel()
        realmModel.idealMonth = self.idealMonth
        realmModel.idealTime = self.idealTime
        realmModel.idealWeather = self.idealWeather
        return realmModel
    }
}
