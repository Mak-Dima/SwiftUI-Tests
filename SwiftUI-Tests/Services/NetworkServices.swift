//
//  NetworkServices.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-14.
//

import Foundation

protocol NetworkServices {
    func fetchData() throws -> Data
}

final class MockHTTPService: NetworkServices {
    
    var data: Data?
    
    init(with data: Data? = nil) {
        let unwrapped = data ?? Data()
        self.data = unwrapped
    }
    
    func fetchData() throws -> Data {
        let data = self.data ?? Data()
        return data
    }
}
