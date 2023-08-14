//
//  IdealConditionRealmModel.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import Foundation
import RealmSwift

class IdealConditionRealmModel: Object {
    @Persisted var idealMonth: Int? // 理想な月
    @Persisted var idealTime: Int? // 理想な時
    @Persisted var idealWeather: String?
}

extension IdealConditionRealmModel {
    private static var config = Realm.Configuration(schemaVersion: 1)
    private static var realm = try! Realm(configuration: config)
}
