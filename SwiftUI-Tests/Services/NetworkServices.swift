//
//  NetworkServices.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-14.
//

import Foundation

protocol NetworkService {
    func fetchData() async throws -> Data
}

final class MockHTTPService: NetworkService {
    
    var data: Data
    var error: Bool = false
    
    init(with data: Data = Data(), throw error: Bool = false) {
        self.data = data
        self.error = error
    }
    
    func fetchData() async throws -> Data {
        try await Task.sleep(for: .seconds(3)) 
        if self.error {
            throw NSError(domain: "Test", code: 0, userInfo: nil)
        }
        
        return self.data
    }
}
