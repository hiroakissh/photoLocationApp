//
//  IdealEnum.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/14.
//

import Foundation

enum IdealMonth: Int, CaseIterable, Identifiable {
    case january = 1
    case february = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12

    var id: String { self.rawValue.description }
}

enum IdealWeather: String, CaseIterable, Identifiable {
    case sunny = "晴れ"
    case cloudy = "曇り"
    case mist = "霧"
    case rain = "雨"
    case snow = "雪"
    case thunder = "雷"

    var id: String { self.rawValue }
}
