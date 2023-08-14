//
//  SaveLocationRepository.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import Foundation
import RealmSwift
import Combine

class saveLocationRepository: SaveRepositoryProtocol {
    private var realm: Realm
    private var cancellables: Set<AnyCancellable> = []
    let saveLocationSubject = CurrentValueSubject<[SaveLocationSwiftModel], Error>([])

    init() {
        let config = Realm.Configuration(schemaVersion: 1)
        realm = try! Realm(configuration: config)
        Realm.Configuration.defaultConfiguration = config
        bind()
    }

    func bind() {
        saveLocationSubject
            .sink { error in
                print("Error")
            } receiveValue: { values in
                print("receiveValue: \(values)")
            }
            .store(in: &cancellables)
    }

    func fetchData() {
        let results = realm.objects(SaveLocationRealmModel.self)
        saveLocationSubject.send(results.map { $0.convertToSwiftModel() })
    }
}
