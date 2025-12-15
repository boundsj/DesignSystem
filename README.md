# DesignSystem

A lightweight SwiftUI-first design system package backed by **design tokens** (starting with colors).

## Requirements

- iOS 16.0+ / macOS 12.0+
- Swift 5.9+
- Xcode 15+

## Installation

Add DesignSystem as a Swift Package dependency:

```swift
dependencies: [
    .package(url: "https://github.com/boundsj/DesignSystem.git", from: "1.0.0")
]
```

Then add `"DesignSystem"` to your target's dependencies.

## Using in SwiftUI

```swift
import SwiftUI
import DesignSystem

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Hello")
                .foregroundStyle(DSColor.Slate.s900)
            Text("Muted")
                .foregroundStyle(DSColor.Slate.s500)
        }
        .padding(16)
        .background(DSColor.Slate.s50)
    }
}
```

For a quick visual check, render `DSColorPreview()` in your app previews:

```swift
#Preview {
    DSColorPreview()
}
```

## Current Color Tokens

### Primitives (Slate)

| Token | Hex |
|-------|-----|
| `DSColor.Slate.s50` | `#F8FAFC` |
| `DSColor.Slate.s100` | `#F1F5F9` |
| `DSColor.Slate.s200` | `#E2E8F0` |
| `DSColor.Slate.s300` | `#CBD5E1` |
| `DSColor.Slate.s400` | `#94A3B8` |
| `DSColor.Slate.s500` | `#64748B` |
| `DSColor.Slate.s600` | `#475569` |
| `DSColor.Slate.s700` | `#334155` |
| `DSColor.Slate.s800` | `#1E293B` |
| `DSColor.Slate.s900` | `#0F172A` |

### Semantic

Semantic color tokens are planned but not yet available. Once added in Figma and synced, they will be accessible via `DSColor` (e.g., `DSColor.textPrimary`, `DSColor.surface`).

## Project Structure

```
Sources/DesignSystem/
├── Tokens/
│   └── DSColor.swift          # Generated color tokens (DO NOT EDIT)
├── Previews/
│   └── DSColorPreview.swift   # Visual preview of all colors
└── Resources/
    └── Colors.xcassets/       # Generated color assets
        └── primitive/slate/   # Slate palette colorsets
```

---

## Figma → Swift Sync

The design system uses **Figma Variables** as the source of truth.

### Figma Setup

**Design Library file:** [Design-Library](https://www.figma.com/design/EY4dEkIjYNcF793t6O1koW/Design-Library)

Create Variables in collections with these naming conventions:

| Collection | Variable Format | Example |
|------------|-----------------|---------|
| `Color/Primitives` | `{palette}/{shade}` | `slate/50`, `slate/100`, ... |
| `Color/Semantic` | `{name}` or `{group}/{name}` | `background`, `text/primary` |

For dark mode support, add a second **Mode** to each collection (e.g., `Light`, `Dark`).

### Syncing Colors to Swift

1. Open the Design Library file in **Figma Desktop** (must be the active tab)
2. In Cursor, ask: **"sync Figma colors"**

Cursor will:
- Fetch all color variables from Figma via MCP
- Generate `.colorset` files in `Resources/Colors.xcassets/`
- Generate `Tokens/DSColor.swift` with type-safe accessors

> **Note:** The Figma Variables REST API requires an Enterprise plan. This project uses the Figma Desktop MCP integration instead, which works on any plan.

### Planned Semantic Tokens

Add these in Figma under a `Color/Semantic` collection, then run the sync:

- `background`, `surface`
- `text/primary`, `text/secondary`, `text/muted`
- `border`, `accent`
