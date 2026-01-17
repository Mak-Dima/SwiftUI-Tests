//
//  DataList.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-13.
//

import SwiftUI

struct DataList: View {
    
    @StateObject var viewModel: DataListViewModel
    
    init(vm: DataListViewModel) {
        _viewModel = StateObject(wrappedValue: vm)
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
                    List {
                        ForEach(viewModel.data, id: \.self) { item in
                            Text(item)
                        }
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
    let mockData = try! JSONEncoder().encode(["data 1", "data 2", "data 3", "data 4", "data 5"])
    let service = MockHTTPService(with: mockData)
    let viewModel = DataListViewModel(service: service)
    DataList(vm: viewModel)
}

#Preview("Error") {
    let service = MockHTTPService(throw: true)
    let viewModel = DataListViewModel(service: service)
    DataList(vm: viewModel)
}
