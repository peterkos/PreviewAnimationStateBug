//
//  Modal.swift
//  PreviewAnimationStateBug
//
//  Created by Peter Kos on 4/17/24.
//

import SwiftUI

struct Modal: View {
    // Can't use @Env(dismiss) as we're not in a sheet
    @Binding var presentSelf: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .fill(.black)
            .opacity(0.8)
            .overlay(
                Text("The Overlay")
            )
            .onTapGesture {
                presentSelf.toggle()
            }
    }
}

#Preview {
    Modal(presentSelf: .constant(true))
}
