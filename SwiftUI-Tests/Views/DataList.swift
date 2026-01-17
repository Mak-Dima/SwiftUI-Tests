//
//  DataList.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-13.
//

import SwiftUI

struct DataList: View {
    
    @StateObject var viewModel: DataListViewModel
    
    init(service: NetworkService) {
        _viewModel = StateObject(wrappedValue: DataListViewModel(service: service))
    }
    
    var body: some View {
        switch viewModel.state {
            case .loading:
                ProgressView()
                .scaleEffect(1.5)
                .task {
                    await viewModel.loadData()
                }

            case .error:
            ErrorView(message: viewModel.error!.localizedDescription)
            
            case .ready:
                VStack(spacing: 5) {
                    List(viewModel.data) { item in
                        Text(item.name)
                    }
                    .scrollContentBackground(.hidden)
                    .accessibilityIdentifier("id_DataList")
                }
                .background(Color(.systemGray5))
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .buttonSizing(.flexible)
        }
    }
}

#Preview("Ready") {
    let mockData = try! JSONEncoder().encode(previewDataObjects)
    let service = MockHTTPService(with: mockData)
    DataList(service: service)
}

#Preview("Error") {
    let service = MockHTTPService(throw: true)
    DataList(service: service)
}
