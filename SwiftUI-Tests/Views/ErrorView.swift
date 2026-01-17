//
//  ErrorView.swift
//  SwiftUI-Tests
//
//  Created by Dmytro Maksiutenko on 2026-01-17.
//

import SwiftUI

struct ErrorView: View {
    @State var message: String
    
    var body: some View {
        ZStack {
            HStack {
                Text(message)
                    .padding()
                    .lineLimit(12)
            }
            .frame(maxWidth: 300, maxHeight: 300)
            .background{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(Color.white.opacity(0.2))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.6))
    }
}

#Preview("Short Message") {
    ErrorView(message: "Eerror message.")
        .background(Color.blue)
}

#Preview("Long Message") {
    let longMessage = """
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        """
    ErrorView(message: longMessage)
        .background(Color.blue)
}
