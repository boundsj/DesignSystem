# DesignSystem

A lightweight SwiftUI-first design system package backed by **design tokens** (starting with colors).

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

### Current Color Tokens

#### Primitives (Slate)

| Variable | Hex |
|----------|-----|
| `slate/50` | `#F8FAFC` |
| `slate/100` | `#F1F5F9` |
| `slate/200` | `#E2E8F0` |
| `slate/300` | `#CBD5E1` |
| `slate/400` | `#94A3B8` |
| `slate/500` | `#64748B` |
| `slate/600` | `#475569` |
| `slate/700` | `#334155` |
| `slate/800` | `#1E293B` |
| `slate/900` | `#0F172A` |

#### Semantic (coming soon)

Add these in Figma under a `Color/Semantic` collection, then run the sync script:

- `background`, `surface`
- `text/primary`, `text/secondary`, `text/muted`
- `border`, `accent`

## Using in SwiftUI

In your app:

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

Once semantic colors are added in Figma and synced:

```swift
Text("Hello")
  .foregroundStyle(DSColor.textPrimary)
  .background(DSColor.surface)
```

For a quick visual check, you can render `DSColorPreview()` in your app previews.


