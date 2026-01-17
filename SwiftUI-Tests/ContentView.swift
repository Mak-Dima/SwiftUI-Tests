//
//  ContentView.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-12.
//

import SwiftUI

struct ContentView: View {
    @State var isLoaded: Bool = false
    
    var service: NetworkService
    
    var body: some View {
        if isLoaded {
            DataList(service: service)
        } else {
            LoadView(isLoaded: $isLoaded)
        }
    }
}

#Preview {
    let service = MockHTTPService()
    ContentView(service: service)
}
