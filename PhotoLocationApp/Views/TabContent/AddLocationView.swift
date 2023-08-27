//
//  AddLocationView.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import SwiftUI
import CoreLocation

struct AddLocationView: View {
    @ObservedObject var viewModel: AddLocationViewModel
    @StateObject private var locationManager = LocationManager()

    @State private var isIdealCondition = false

    @State private var selectedMonth: IdealMonth = .january
    @State private var selectedTime: Int = 0
    @State private var selectedWeather: IdealWeather = .sunny

    var body: some View {
        VStack {
            HStack {
                Text("名前")
                    .padding()
                TextField("名前を記入してください", text: $viewModel.name)
            }
            .padding()

            Toggle("理想の条件を追加する", isOn: $isIdealCondition)
                .padding()

            if isIdealCondition {
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

            Button("位置情報の保存") {
                if viewModel.name == "" { return }
                guard let latitude = locationManager.coordinate?.coordinate.latitude,
                      let longitude = locationManager.coordinate?.coordinate.longitude else { return }
                viewModel.latitude = latitude
                viewModel.longitude = longitude
                viewModel.saveDate = .now
                if isIdealCondition {
                    viewModel.idealMonth = selectedMonth
                    viewModel.idealTime = selectedTime
                    viewModel.idealWeather = selectedWeather
                }
                viewModel.addData()
            }
        }
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView(viewModel: AddLocationViewModel())
    }
}
