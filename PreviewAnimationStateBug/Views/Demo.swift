//
//  Demo.swift
//  PreviewAnimationStateBug
//
//  Created by Peter Kos on 4/17/24.
//

import SwiftUI

struct Demo: View {
    @Environment(\.spacing) private var spacing
    @State private var presented = false
    @State private var presentedOrigin: CGPoint = .zero

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: spacing) {
                ForEach(0 ..< 3, id: \.self) { _ in
                    NiceRect(
                        presented: $presented,
                        presentedOrigin: $presentedOrigin
                    )
                }
            }
            .padding(spacing)
            .overlay {
                if presented {
                    Modal(presentSelf: $presented)
                        .transition(
                            CustomOffset(
                                offset: presentedOrigin,
                                center: CGPoint.centerOf(rect: geo.frame(in: .local))
                            )
                        )
                }
            }
            .animation(.snappy(duration: 0.4), value: presented)
        }
    }
}

extension Demo {
    struct CustomOffset: Transition {
        @State var offset: CGPoint
        @State var center: CGPoint

        @State private var maxFrame: CGFloat = 0.0

        func body(content: Content, phase: TransitionPhase) -> some View {
            content
                .frame(
                    maxWidth: phase.isIdentity ? .infinity : 50,
                    maxHeight: phase.isIdentity ? .infinity : 50
                )
                .position(phase.isIdentity ? center : offset)
                .onChange(of: phase, initial: true) { _, phase in
                    print("Phase is \(phase)")
                }
        }
    }
}

#Preview {
    Demo()
}
