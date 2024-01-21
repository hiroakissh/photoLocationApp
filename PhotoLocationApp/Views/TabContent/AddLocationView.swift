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

    @Binding var selectedTab: MainTab

    @State private var isIdealCondition = false
    @State private var isAddButtonPressed = false

    @State private var selectedMonth: IdealMonth = .january
    @State private var selectedTime: Int = 0
    @State private var selectedWeather: IdealWeather = .sunny

    @State private var isShowAlert = false

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
                if !locationManager.isAuthLocation() {
                    isShowAlert = true
                    return
                }
                if viewModel.name == "" {
                    isShowAlert = true
                    return
                }
                isShowAlert = false
                guard let latitude = locationManager.coordinate?.coordinate.latitude,
                      let longitude = locationManager.coordinate?.coordinate.longitude else { 
                    isShowAlert = true

                    return
                }
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
                selectedTab = .locationList
            }
            .alert("保存エラー", isPresented: $isShowAlert) {
                if !locationManager.isAuthLocation() {
                    Button("設定画面を開く") {
                        if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
                           UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }
                Button("戻る") {}
            } message: {
                if !locationManager.isAuthLocation() {
                    Text("設定画面で位置情報を有効にしてください")
                } else {
                    Text("名前が空です。名前をつけて保存してください")
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
    @State static private var sampleActiveTab: MainTab = .addLocationTab
    static var previews: some View {
        AddLocationView(
            viewModel: AddLocationViewModel(),
            selectedTab: $sampleActiveTab
        )
    }
}
