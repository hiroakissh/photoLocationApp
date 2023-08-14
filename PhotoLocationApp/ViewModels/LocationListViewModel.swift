//
//  LocationListViewModel.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import Foundation
import Combine

class LocationListViewModel: ObservableObject {
    @Published private(set) var saveLocations: [SaveLocationSwiftModel] = []
    @Published private(set) var errorMessage: String? = nil
    @Published private(set) var isLoading = false
    private var cancellables: Set<AnyCancellable> = []
    let saveLocationSubject = CurrentValueSubject<[SaveLocationSwiftModel], Error>([])

    private let repository: SaveLocationRepositoryProtocol

    init(saveLocationRepository: SaveLocationRepositoryProtocol = saveLocationRepository()) {
        self.repository = saveLocationRepository
        bind()
    }

    func bind() {

        repository.fetchData()
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished")
                case.failure(let error):
                    print("error")
                    print(error)
                }
            } receiveValue: { results in
                self.saveLocations = results
            }
            .store(in: &cancellables)
    }
}
