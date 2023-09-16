//
//  IdealConditionView.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/09/03.
//

import SwiftUI

struct IdealConditionView: View {
    @Binding var selectedMonth: IdealMonth
    @Binding var selectedTime: Int
    @Binding var selectedWeather: IdealWeather

    var body: some View {
        VStack {
            HStack {
                Text("理想な月")
                    .padding()
                Picker("理想な月", selection: $selectedMonth) {
                    Text("None").tag(nil as IdealMonth?)
                    ForEach(IdealMonth.allCases) { month in
                        Text(month.rawValue.description).tag(month)
                    }
                }
            }
            .padding()

            HStack {
                Text("理想な時間帯")
                    .padding()
                Picker("理想な時間帯", selection: $selectedTime) {
                    Text("None").tag(nil as Int?)
                    ForEach(0..<25, id: \.self) { time in
                        Text(String(time))
                    }
                }
            }
            .padding()

            HStack {
                Text("理想な天気")
                    .padding()
                Picker("理想の天気", selection: $selectedWeather) {
                    Text("None").tag(nil as IdealWeather?)
                    ForEach(IdealWeather.allCases) { weather in
                        Text(weather.rawValue).tag(weather)
                    }
                }
            }
            .padding()
        }
    }
}

struct IdealConditionView_Previews: PreviewProvider {
    static var previews: some View {
        IdealConditionView(
            selectedMonth: .constant(.january),
            selectedTime: .constant(1),
            selectedWeather: .constant(.sunny)
        )
    }
}
