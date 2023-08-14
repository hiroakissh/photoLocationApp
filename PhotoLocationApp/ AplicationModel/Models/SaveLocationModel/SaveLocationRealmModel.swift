//
//  SaveLocationRealmModel.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import Foundation
import RealmSwift

class SaveLocationRealmModel: Object {
    @Persisted var uuid: String
    @Persisted var  name: String
    @Persisted var  latitude: Double // 緯度
    @Persisted var  longitude: Double // 経度
    @Persisted var  saveDate: Date
    @Persisted var  idealCondition: IdealConditionRealmModel?
}

extension SaveLocationRealmModel {
    private static var config = Realm.Configuration(schemaVersion: 1)
    private static var realm = try! Realm(configuration: config)
}
