// ============================================================================
// THIS FILE IS GENERATED — DO NOT EDIT
// Ask Cursor to "sync Figma colors" to regenerate
// ============================================================================

import SwiftUI

public enum DSColor {
    // MARK: - Primitives (Slate)
    public enum Slate {
        public static let s50 = Color.dsAsset(.slate50)
        public static let s100 = Color.dsAsset(.slate100)
        public static let s200 = Color.dsAsset(.slate200)
        public static let s300 = Color.dsAsset(.slate300)
        public static let s400 = Color.dsAsset(.slate400)
        public static let s500 = Color.dsAsset(.slate500)
        public static let s600 = Color.dsAsset(.slate600)
        public static let s700 = Color.dsAsset(.slate700)
        public static let s800 = Color.dsAsset(.slate800)
        public static let s900 = Color.dsAsset(.slate900)
    }

    // MARK: - Semantics (Background)
    public enum Background {
        public static let primary = Color.dsAsset(.backgroundPrimary)
        public static let secondary = Color.dsAsset(.backgroundSecondary)
        public static let tertiary = Color.dsAsset(.backgroundTertiary)
    }
}

private enum DSColorAssetName: String {
    // Primitives
    case slate50 = "primitive/slate/50"
    case slate100 = "primitive/slate/100"
    case slate200 = "primitive/slate/200"
    case slate300 = "primitive/slate/300"
    case slate400 = "primitive/slate/400"
    case slate500 = "primitive/slate/500"
    case slate600 = "primitive/slate/600"
    case slate700 = "primitive/slate/700"
    case slate800 = "primitive/slate/800"
    case slate900 = "primitive/slate/900"

    // Semantics - Background
    case backgroundPrimary = "semantic/background/primary"
    case backgroundSecondary = "semantic/background/secondary"
    case backgroundTertiary = "semantic/background/tertiary"
}

private extension Color {
    static func dsAsset(_ name: DSColorAssetName) -> Color {
        Color(name.rawValue, bundle: .module)
    }
}
