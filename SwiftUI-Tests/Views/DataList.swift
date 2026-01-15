//
//  DataList.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-13.
//

import SwiftUI

struct DataList: View {
    let data: [String] = [
        "data 1",
        "data 2",
        "data 3",
        "data 4",
        "data 5",
        "data 8",
        "data 9",
        "data 10",
        "data 11",
        "data 12",
        "data 13",
        "data 14",
        "data 15",
        "data 16",
        "data 17",
        "data 18",
        "data 19",
        "data 20",
        "data 21",
        "data 22",
    ]
    
    var body: some View {
        VStack(spacing: 5) {
            List {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
            .scrollContentBackground(.hidden)
            .accessibilityIdentifier("id_DataList")
            
            
            Button {
                print("Refresh pressed.")
            } label: {
                Text("Refresh")
            }
            .padding(10)
        }
        .background(Color(.systemGray5))
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle)
        .buttonSizing(.flexible)
    }
}

#Preview {
    DataList()
}
