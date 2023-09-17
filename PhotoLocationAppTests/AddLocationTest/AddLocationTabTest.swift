//
//  AddLocationTabTest.swift
//  PhotoLocationAppTests
//
//  Created by HiroakiSaito on 2023/09/17.
//

import XCTest
import Combine
@testable import PhotoLocationApp

final class AddLocationTabTest: XCTestCase {
    var viewModel: AddLocationViewModel!
    var mockRepository: MockAddLocationRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockAddLocationRepository()
        viewModel = AddLocationViewModel(addLocationRepository: mockRepository)
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    func testAddDataSuccess() {
        // テストのために結果を成功に設定
        mockRepository.addDataResult = true

        // ビューモデルのプロパティを設定
        viewModel.name = "Test Location"
        viewModel.latitude = 42.0
        viewModel.longitude = -73.0
        viewModel.saveDate = Date()
        viewModel.idealMonth = .january
        viewModel.idealTime = 1
        viewModel.idealWeather = .sunny

        // ビューモデルのメソッドを呼び出す
        viewModel.addData()

        // テストが成功するかどうかを検証
        XCTAssertTrue(viewModel.isAddDataResult)
    }

    func testAddDataFailure() {
        // テストのために結果を失敗に設定
        mockRepository.addDataResult = false

        // ビューモデルのプロパティを設定
        viewModel.name = "Test Location"
        viewModel.latitude = 42.0
        viewModel.longitude = -73.0
        viewModel.saveDate = Date()
        viewModel.idealMonth = .january
        viewModel.idealTime = 1
        viewModel.idealWeather = .sunny

        // ビューモデルのメソッドを呼び出す
        viewModel.addData()

        // テストが失敗するかどうかを検証
        XCTAssertFalse(viewModel.isAddDataResult)
    }
}
