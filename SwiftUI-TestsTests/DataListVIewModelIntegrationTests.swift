//
//  DataListVIewModelIntegrationTests.swift
//  SwiftUI-TestsTests
//
//  Created by Dmytro Maksiutenko on 2026-01-15.
//

import Testing
import Foundation
@testable import SwiftUI_Tests

@MainActor
struct DataListVIewModelIntegrationTests {

    @Test("Test DataListViewModel integration with network service.")
    func testViewModelIntegrationWithNetwork() async throws {
        let mockData = try JSONEncoder().encode(["1", "2", "3"])
        let mockService = MockHTTPService(with: mockData)
        let viewModel = DataListViewModel(service: mockService)
        
        await viewModel.loadData()
        #expect(viewModel.data == ["1", "2", "3"])
    }
    
    @Test()
    func testViewModelIntegrationWithNetworkThrows() async {
        let mockService = MockHTTPService(throw: true)
        let viewModel = DataListViewModel(service: mockService)
    
        await viewModel.loadData()
        #expect(viewModel.error != nil)
    }

}
