//
//  IdealConditionSwiftModel.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import Foundation

class IdealConditionSwiftModel: Identifiable {
    let idealMonth: Int? // 理想な月
    let idealTime: Int? // 理想な時
    let idealWeather: String?

    init(
        idealMonth: Int?,
        idealTime: Int?,
        idealWeather: String?
    ) {
        self.idealMonth = idealMonth
        self.idealTime = idealMonth
        self.idealWeather = idealWeather
    }
}
