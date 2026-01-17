//
//  SwiftUI_TestsIntegrationTest.swift
//  SwiftUI-TestsIntegrationTest
//
//  Created by Dmytro Maksiutenko on 2026-01-17.
//

import Testing
import Foundation
@testable import SwiftUI_Tests

@MainActor
struct SwiftUI_TestsIntegrationTest {

    @Test("Test DataListViewModel integration with network service.")
    func testViewModelIntegrationWithNetwork() async throws {
        let mockData = try JSONEncoder().encode(previewDataObjects)
        let mockService = MockHTTPService(with: mockData)
        let viewModel = DataListViewModel(service: mockService)
        
        await viewModel.loadData()
        #expect(viewModel.data == previewDataObjects)
    }
    
    @Test()
    func testViewModelIntegrationWithNetworkThrows() async {
        let mockService = MockHTTPService(throw: true)
        let viewModel = DataListViewModel(service: mockService)
    
        await viewModel.loadData()
        #expect(viewModel.error != nil)
    }
}
