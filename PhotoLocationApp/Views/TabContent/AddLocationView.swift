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
    @State private var isAddButtonPressed = false

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

            Toggle("理想の条件を追加する", isOn: $isIdealCondition.animation(.easeInOut(duration: 0.5)))
                .padding()

            if isIdealCondition {
                IdealConditionView(
                    selectedMonth: $selectedMonth,
                    selectedTime: $selectedTime,
                    selectedWeather: $selectedWeather
                )
                .transition(.opacity)
            }

            if isAddButtonPressed {
                AddButtonPresseView(isDetailViewVisible: $isAddButtonPressed)
                    .transition(.scale)
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
                withAnimation {
                    isAddButtonPressed.toggle()
                }
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView(viewModel: AddLocationViewModel())
    }
}
