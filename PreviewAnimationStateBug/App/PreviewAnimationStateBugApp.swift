//
//  PreviewAnimationStateBugApp.swift
//  PreviewAnimationStateBug
//
//  Created by Peter Kos on 4/17/24.
//

import SwiftUI

@main
struct PreviewAnimationStateBugApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

// MARK: - Math Helper

extension CGPoint {
    static func centerOf(rect: CGRect) -> CGPoint {
        CGPoint(
            x: rect.midX,
            y: rect.midY
        )
    }
}

// MARK: - Environment Helper

struct SpacingKey: EnvironmentKey {
    static var defaultValue: CGFloat = 10.0
}

extension EnvironmentValues {
    var spacing: CGFloat {
        get { self[SpacingKey.self] }
        set { self[SpacingKey.self] = newValue }
    }
}
