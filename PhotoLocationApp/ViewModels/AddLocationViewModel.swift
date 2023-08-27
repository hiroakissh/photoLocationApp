//
//  AddLocationViewModel.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import Foundation
import Combine

class AddLocationViewModel: ObservableObject {
    @Published var isAddDataResult = false

    @Published var name = ""
    @Published var saveDate = Date()
    @Published var latitude = 0.0
    @Published var longitude = 0.0
    @Published var idealMonth: IdealMonth?
    @Published var idealTime: Int?
    @Published var idealWeather: IdealWeather?


    private var cancellables: Set<AnyCancellable> = []

    private let repository: AddLocationRepositoryProtocol

    init(addLocationRepository: AddLocationRepositoryProtocol = AddLocationRepository()) {
        self.repository = addLocationRepository
        isAddDataResult = false
        bind()
    }

    private func bind() {}

    func addData() {
        let idealCondition = IdealConditionSwiftModel(
            idealMonth: idealMonth?.rawValue,
            idealTime: idealTime,
            idealWeather: idealWeather?.rawValue
        )

        let saveData = SaveLocationSwiftModel(
            name: name,
            latitude: latitude,
            longitude: longitude,
            saveDate: saveDate,
            idealCondition: idealCondition
        )

        repository.addData(data: saveData)
            .sink { completion in
            switch completion {
            case .finished:
                print("finished")
            case .failure(let error):
                print("error")
                print(error)
            }
        } receiveValue: { result in
            self.isAddDataResult = result
        }
        .store(in: &cancellables)
    }
}
