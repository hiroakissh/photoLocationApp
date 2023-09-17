//
//  AddLocationMock.swift
//  PhotoLocationAppTests
//
//  Created by HiroakiSaito on 2023/09/17.
//

import Foundation
import Combine
@testable import PhotoLocationApp

// モックの実装
class MockAddLocationRepository: AddLocationRepositoryProtocol {

    var addDataResult: Bool = true // テストのために結果を制御

    func addData(data: PhotoLocationApp.SaveLocationSwiftModel) -> Future<Bool, Error> {
        // モックの実装で結果を返す
        let result = addDataResult // テストのための結果

        return Future<Bool, Error> { promise in
            promise(.success(result))
        }
    }
}
