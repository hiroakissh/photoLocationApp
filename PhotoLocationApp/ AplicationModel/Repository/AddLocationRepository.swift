//
//  AddLocationRepository.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/14.
//

import Foundation
import RealmSwift
import Combine

protocol AddLocationRepositoryProtocol {
    func addData(data: SaveLocationSwiftModel) -> Future<Bool, Error>
}

class AddLocationRepository: AddLocationRepositoryProtocol {

    func addData(data: SaveLocationSwiftModel) -> Future<Bool, Error> {
        let realmData = data.convertToRealmModel()
        return Future<Bool, Error> { value in
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(realmData)
                }
                value(.success(true))
            } catch(let error) {
                value(.failure(error))
            }
        }
    }
}
