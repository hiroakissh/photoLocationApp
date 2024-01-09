//
//  SaveLocationRepository.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import Foundation
import RealmSwift
import Combine

enum RealmError: Error {
    case accessError
}

protocol SaveLocationRepositoryProtocol {
    func fetchData() -> Future<[SaveLocationSwiftModel], Error>
    func removeData(removeLocation: SaveLocationSwiftModel)
}

class saveLocationRepository: SaveLocationRepositoryProtocol {
    private var realm: Realm

    init() {
        realm = try! Realm()
    }

    func fetchData() -> Future<[SaveLocationSwiftModel], Error> {
        let realmResults = realm.objects(SaveLocationRealmModel.self)
        let arrayResults: Array<SaveLocationRealmModel> = Array(realmResults)
        let swiftData = arrayResults.map { $0.convertToSwiftModel() }
        return Future<[SaveLocationSwiftModel], Error> { value in
            value(.success(swiftData))
        }
    }

    func removeData(removeLocation: SaveLocationSwiftModel) {
        do {
            try realm.write {
                print(removeLocation.convertToRealmModel())
                let predicate = NSPredicate(format: "uuid == %@", removeLocation.uuid)
                if let deleteObject = realm.objects(SaveLocationRealmModel.self)
                    .filter(predicate).first {
                    realm.delete(deleteObject)
                }
            }
        } catch {
            print("Delete Error")
        }
    }
}
