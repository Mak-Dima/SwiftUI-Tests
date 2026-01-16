//
//  SwiftUI_TestsTests.swift
//  SwiftUI-TestsTests
//
//  Created by Dmytro Maksiutenko on 2026-01-12.
//

import Testing
import Foundation
@testable import SwiftUI_Tests

@MainActor
struct SwiftUI_TestsTests {

    @Test("Mock HTTP Service test initialization with data.")
    func mockHTTPServiceInit() async {
        let mockData = Data([1, 2, 3])
        let mockService = MockHTTPService(with: mockData)
        
        do {
            let data = try await mockService.fetchData()
            #expect(type(of: data) == Data.self)
            #expect(!data.isEmpty)
        } catch { }
    }

    @Test("Mock HTTP Service test fetch throws and error.")
    func MockHTTPServiceFetchDataThrows() async throws {
        let mockService = MockHTTPService(throw: true)

        await #expect(throws: NSError.self, "Error wasn't thrown") {
            try await mockService.fetchData()
        }
    }
}
