//
//  DataListViewModel.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-15.
//

import Foundation
internal import Combine

@MainActor
class DataListViewModel: ObservableObject {
    @Published private(set) var state: ViewState = .loading
    @Published private(set) var data: [DataObject] = []
    @Published private(set) var error: Error? = nil
    
    private let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func loadData() async {
        do {
            self.data = try await service.fetchData()
            self.state = .ready
        } catch {
            self.state = .error
            self.error = error
        }
    }
}
