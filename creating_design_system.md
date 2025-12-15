# Creating a Custom Design System

> **Goal**: Build a Figma design library + Swift package that work together as a cohesive design system for iOS apps.

---

## Overview: The Workflow

```
┌─────────────────────────────────────────────────────────────────┐
│                        FIGMA                                     │
├─────────────────────────────────────────────────────────────────┤
│  📁 Design Library File          📁 App Design File             │
│  ├── Tokens (colors, fonts)      ├── Uses Design Library        │
│  ├── Components (buttons, etc)   ├── App screens                │
│  └── Published as Library        └── Prototypes                 │
└─────────────────────────────────────────────────────────────────┘
                              ↓ sync
┌─────────────────────────────────────────────────────────────────┐
│                         CODE                                     │
├─────────────────────────────────────────────────────────────────┤
│  📦 DesignSystem Swift Package   📱 App Xcode Project           │
│  ├── Tokens/                     ├── import DesignSystem        │
│  ├── Components/                 ├── Views using components     │
│  └── Published to GitHub         └── Dependencies on package    │
└─────────────────────────────────────────────────────────────────┘
```

This is called a **"Design System as Single Source of Truth"** approach where Figma is the source and code mirrors it.

---

## Best Practices

### 1. Structure Your Figma Design Library

```
Design Library (Figma)
├── 📄 Tokens Page
│   ├── Colors (as Figma Variables)
│   ├── Typography (text styles)
│   ├── Spacing (number variables)
│   └── Radius (number variables)
├── 📄 Primitives Page
│   ├── Icons
│   └── Illustrations
└── 📄 Components Page
    ├── Buttons
    ├── Inputs
    ├── Cards
    ├── Bottom Sheets
    └── List Rows
```

### 2. Use Figma Variables (Key!)

Define all tokens as Figma Variables with **modes** for Light/Dark. This makes syncing to code much easier.

### 3. Sync Figma → Code

Options for keeping in sync:
- **Manual**: Export JSON from Figma, run a script to generate Swift
- **Tokens Studio Plugin**: Export design tokens in standard format
- **Cursor + MCP**: Use Figma MCP tools to extract tokens directly

### 4. Version Together

When you update Figma, bump the Swift package version. Keep a changelog.

---

## The Plan

### Phase 1: Set Up the Figma Design Library

1. Create a new Figma file for your design system
2. Set up Variables for your color tokens (using shadcn's Slate as a base)
3. Define typography (SF Pro or a custom choice)
4. Create basic iOS components

**Figma File Structure:**
```
📁 MyDesignSystem.fig
├── 📄 Cover
├── 📄 Tokens
│   ├── Colors (Variables: primitive + semantic)
│   ├── Typography (Text Styles)
│   ├── Spacing (Number Variables)
│   └── Radius (Number Variables)
├── 📄 Components
│   ├── Buttons
│   ├── List Rows
│   ├── Cards
│   ├── Bottom Sheets
│   ├── Navigation Bar
│   └── Tab Bar
└── 📄 Documentation
```

### Phase 2: Create the Swift Package

1. Create `DesignSystem` Swift package
2. Add token files (Colors, Typography, Spacing)
3. Build SwiftUI components matching Figma

**Swift Package Structure:**
```
DesignSystem/
├── Package.swift
├── Sources/
│   └── DesignSystem/
│       ├── Tokens/
│       │   ├── Colors.swift
│       │   ├── Typography.swift
│       │   ├── Spacing.swift
│       │   └── Radius.swift
│       ├── Components/
│       │   ├── DSButton.swift
│       │   ├── DSListRow.swift
│       │   ├── DSCard.swift
│       │   ├── DSBottomSheet.swift
│       │   └── DSNavigationBar.swift
│       └── Extensions/
│           └── View+DesignSystem.swift
└── Tests/
    └── DesignSystemTests/
```

### Phase 3: Build Your App

1. Create app Figma file using the design library
2. Create app Xcode project importing the package
3. Build screens using the components

---

## Design Direction: Low-Res / Minimal Aesthetic

Inspired by shadcn/ui but adapted for iOS:

### Keep from shadcn:
- The Slate color palette (low-contrast, muted colors)
- The minimalist aesthetic
- The token structure

### Replace/Add for iOS:
- iOS navigation patterns (tab bar, navigation bar)
- iOS-native components (List rows, sheets, action sheets)
- SF Pro font (or a pixel font for retro feel)

### Pixel/Retro Touches (Optional):
- Corner radius: 0 or 4px (sharp, chunky)
- 1-2px borders
- Limited color palette (8-16 colors max)
- Consider a pixel font for headers

---

## Color Tokens (shadcn Slate Base)

From the shadcn/ui Figma file:

| Token | Hex | Usage |
|-------|-----|-------|
| `slate/50` | #F8FAFC | Lightest background |
| `slate/100` | #F1F5F9 | Light background |
| `slate/200` | #E2E8F0 | Borders, dividers |
| `slate/300` | #CBD5E1 | Disabled states |
| `slate/400` | #94A3B8 | Placeholder text |
| `slate/500` | #64748B | Secondary text |
| `slate/600` | #475569 | Primary text (light mode) |
| `slate/700` | #334155 | Emphasized text |
| `slate/800` | #1E293B | Dark backgrounds |
| `slate/900` | #0F172A | Darkest background |

### Semantic Color Mapping

| Semantic Token | Light Mode | Dark Mode |
|----------------|------------|-----------|
| `background` | slate/50 | slate/900 |
| `surface` | white | slate/800 |
| `text.primary` | slate/900 | slate/50 |
| `text.secondary` | slate/500 | slate/400 |
| `text.muted` | slate/400 | slate/500 |
| `border` | slate/200 | slate/700 |
| `accent` | (your brand color) | (your brand color) |

---

## Typography Tokens

Using SF Pro (iOS native) or custom font:

| Style | Size | Weight | Line Height | Usage |
|-------|------|--------|-------------|-------|
| `largeTitle` | 34pt | Bold | 41pt | Screen titles |
| `title1` | 28pt | Bold | 34pt | Section headers |
| `title2` | 22pt | Bold | 28pt | Card titles |
| `title3` | 20pt | Semibold | 25pt | Subsection |
| `headline` | 17pt | Semibold | 22pt | List row titles |
| `body` | 17pt | Regular | 22pt | Body text |
| `callout` | 16pt | Regular | 21pt | Secondary body |
| `subheadline` | 15pt | Regular | 20pt | Metadata |
| `footnote` | 13pt | Regular | 18pt | Captions |
| `caption1` | 12pt | Regular | 16pt | Small labels |
| `caption2` | 11pt | Regular | 13pt | Tiny labels |

---

## Spacing Scale

| Token | Value | Usage |
|-------|-------|-------|
| `spacing.none` | 0pt | No spacing |
| `spacing.xxs` | 2pt | Minimal |
| `spacing.xs` | 4pt | Tight |
| `spacing.sm` | 8pt | Compact |
| `spacing.md` | 12pt | Default |
| `spacing.lg` | 16pt | Comfortable |
| `spacing.xl` | 24pt | Spacious |
| `spacing.xxl` | 32pt | Large gaps |
| `spacing.xxxl` | 48pt | Section gaps |

---

## Radius Scale

| Token | Value | Usage |
|-------|-------|-------|
| `radius.none` | 0pt | Sharp corners |
| `radius.sm` | 4pt | Subtle rounding |
| `radius.md` | 8pt | Default rounding |
| `radius.lg` | 12pt | Cards, sheets |
| `radius.xl` | 16pt | Large elements |
| `radius.full` | 9999pt | Pills, circles |

---

## Next Steps

- [ ] Phase 1: Create Figma design library file with Variables
- [ ] Phase 1: Define color tokens in Figma
- [ ] Phase 1: Define typography as Text Styles
- [ ] Phase 1: Create first components (Button, ListRow)
- [ ] Phase 2: Create Swift package skeleton
- [ ] Phase 2: Implement color tokens in Swift
- [ ] Phase 2: Implement typography tokens in Swift
- [ ] Phase 2: Build SwiftUI components
- [ ] Phase 3: Create app Figma file
- [ ] Phase 3: Create app Xcode project
- [ ] Phase 3: Build first screen using design system

---

## Resources

- [Figma Variables Documentation](https://help.figma.com/hc/en-us/articles/15339657135383-Guide-to-variables-in-Figma)
- [Tokens Studio Plugin](https://tokens.studio/)
- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [Swift Package Manager](https://www.swift.org/package-manager/)

