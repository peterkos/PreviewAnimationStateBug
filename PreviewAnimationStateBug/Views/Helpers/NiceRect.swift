//
//  NiceRect.swift
//  PreviewAnimationStateBug
//
//  Created by Peter Kos on 4/17/24.
//

import SwiftUI

struct NiceRect: View {
    @Binding var presented: Bool
    @Binding var presentedOrigin: CGPoint

    var body: some View {
        GeometryReader { geo in
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.purple)
                .onTapGesture {
                    presented.toggle()
                    presentedOrigin = CGPoint.centerOf(rect: geo.frame(in: .global))
                }
        }
        .frame(maxWidth: 100, maxHeight: 100)
    }
}

#Preview {
    GeometryReader { geo in
        NiceRect(
            presented: .constant(true),
            presentedOrigin: .constant(
                CGPoint(
                    x: geo.frame(in: .global).midX,
                    y: geo.frame(in: .global).midY
                )
            )
        )
    }
}
