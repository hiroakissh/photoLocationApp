//
//  RepositoryProtocol.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/14.
//

import Foundation
import Combine

protocol SaveRepositoryProtocol {
    func fetchData()
}

protocol AddRepositoryProtocol {
    func addData() -> AnyPublisher<Any, Error>
}
