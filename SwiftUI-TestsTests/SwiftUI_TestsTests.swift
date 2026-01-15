//
//  SwiftUI_TestsTests.swift
//  SwiftUI-TestsTests
//
//  Created by Dmytro Maksiutenko on 2026-01-12.
//

import Testing
import Foundation
@testable import SwiftUI_Tests

struct SwiftUI_TestsTests {

    @Test("Mock HTTP Service test initialization.") func mockHTTPService() {
        let mockData = Data([1, 2, 3])
        let mockService = MockHTTPService(with: mockData)
        
        do {
            let data = try mockService.fetchData()
            #expect(type(of: data) == Data.self)
            #expect(!data.isEmpty)
        } catch { }
    }

}
