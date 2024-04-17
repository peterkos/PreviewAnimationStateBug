# Transition state bug in Previews for macOS

## Environment
```
Xcode 15.3
macOS 14.3.1
Apple Swift version 5.10 (swiftlang-5.10.0.13 clang-1500.3.9.4)
Target: arm64-apple-macosx14.0
```
## Reproduction steps
1. Open the project
2. Preview the `Demo.swift` file in Xcode, with console “Preview” output selected
3. Click on a rectangle
4. Observe the overlay view
5. Click anywhere on the overlay view to dismiss
6. **Actual**: Animation jumps to identity state.
   1. ```
      Phase is identity
      Phase is didDisappear
      ```
7. **Expected**: Animation correctly shows `willAnimate` state
   1. ```
      Phase is willAppear
      Phase is identity
      Phase is didDisappear
      ```
