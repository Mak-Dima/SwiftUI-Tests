//
//  DataListViewModel.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-15.
//

import Foundation
internal import Combine

class DataListViewModel: ObservableObject {
    @Published var state: ViewState = .loading
    @Published var data: [String] = []
    @Published var error: Error?
    
    let httpService: NetworkService
    
    init(service: NetworkService) {
        self.httpService = service
    }
    
    func loadData() async {
        do {
            let data = try await httpService.fetchData()
            let decodedData = try JSONDecoder().decode([String].self, from: data)
            self.data = decodedData
            self.state = .ready
        } catch {
            self.state = .error
            self.error = error
        }
    }
}
