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
    
    var data: Data
    var error: Bool = false
    
    init(with data: Data = Data(), throw error: Bool = false) {
        self.data = data
        self.error = error
    }
    
    func fetchData() throws -> Data {
        if self.error {
            throw NSError(domain: "Test", code: 0, userInfo: nil)
        }
        
        return self.data
    }
}
