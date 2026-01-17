//
//  SwiftUI_TestsApp.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-12.
//

import SwiftUI

@main
struct SwiftUI_TestsApp: App {
    
    private let service: NetworkService
    
    init() {
        if CommandLine.arguments.contains("--ui-testing") {
            let data = try! JSONEncoder().encode(previewDataObjects)
            service = MockHTTPService(with: data)
        } else {
            service = HTTPService()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(service: service)
        }
    }
}
