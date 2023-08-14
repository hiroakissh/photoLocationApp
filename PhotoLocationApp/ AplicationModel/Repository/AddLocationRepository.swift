//
//  AddLocationRepository.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/14.
//

import Foundation
import Combine

protocol AddLocationRepositoryProtocol {
    func addData() -> AnyPublisher<Any, Error>
}
