//
//  NetworkServices.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-14.
//

import Foundation

protocol NetworkService {
    func fetchData() async throws -> [DataObject]
}

final class HTTPService: NetworkService {
    
    func fetchData() async throws -> [DataObject] {
        if let url = URL(string: "http://localhost:8080/default/read") {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NSError(domain: "Wrong status code", code: 0)
            }
            
            let decodedData = try JSONDecoder().decode([DataObject].self, from: data)
            return decodedData
        }
       
        throw NSError(domain: "Invalid URL string", code: 0)
    }
}

final class MockHTTPService: NetworkService {
    
    var data: Data
    var error: Bool = false
    
    init(with data: Data = Data(), throw error: Bool = false) {
        self.data = data
        self.error = error
    }
    
    func fetchData() async throws -> [DataObject] {
        try await Task.sleep(for: .seconds(3))
        if self.error {
            throw NSError(domain: "Test", code: 0, userInfo: nil)
        }
        
        do {
            let decodedData = try JSONDecoder().decode([DataObject].self, from: self.data)
            return decodedData
        } catch {
            throw error
        }
    }
}
