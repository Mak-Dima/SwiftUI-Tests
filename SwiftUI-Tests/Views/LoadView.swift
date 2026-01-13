//
//  LoadView.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-13.
//

import SwiftUI

struct LoadView: View {
    
    @Binding var isLoaded: Bool
    
    var body: some View {
        HStack {
            Button {
                isLoaded.toggle()
                print("Load button pressed")
            } label: {
                Text("Load")
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    @Previewable @State var isLoaded: Bool = false
    LoadView(isLoaded: $isLoaded)
}
