//
//  SaveLocationRepositoryMock.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/09/03.
//

import Foundation
import Combine

class SaveLocationRepositoryMock: SaveLocationRepositoryProtocol {
    func fetchData() -> Future<[SaveLocationSwiftModel], Error> {
        let testLocation1 = SaveLocationSwiftModel(
            name: "test1",
            latitude: 35.6894,
            longitude: 139.6917,
            saveDate: .now,
            idealCondition: nil
        )

        let testLocation2 = SaveLocationSwiftModel(
            name: "test1",
            latitude: 35.6894,
            longitude: 139.6917,
            saveDate: .now,
            idealCondition: nil
        )

        let testLocation3 = SaveLocationSwiftModel(
            name: "test1",
            latitude: 35.6894,
            longitude: 139.6917,
            saveDate: .now,
            idealCondition: nil
        )

        return Future<[SaveLocationSwiftModel], Error> { value in
            value(.success([testLocation1,
                           testLocation2,
                           testLocation3]))
        }
    }

    func removeData(removeLocation: SaveLocationSwiftModel) {
        print(remove)
    }
}
