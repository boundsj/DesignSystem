import SwiftUI

public struct DSColorPreview: View {
    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                primitiveSection
            }
            .padding(16)
        }
        .background(DSColor.Slate.s50)
    }

    private var primitiveSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Primitives / Slate")
                .font(.headline)
                .foregroundStyle(DSColor.Slate.s900)

            VStack(spacing: 10) {
                row("slate/50", DSColor.Slate.s50)
                row("slate/100", DSColor.Slate.s100)
                row("slate/200", DSColor.Slate.s200)
                row("slate/300", DSColor.Slate.s300)
                row("slate/400", DSColor.Slate.s400)
                row("slate/500", DSColor.Slate.s500)
                row("slate/600", DSColor.Slate.s600)
                row("slate/700", DSColor.Slate.s700)
                row("slate/800", DSColor.Slate.s800)
                row("slate/900", DSColor.Slate.s900)
            }
        }
    }

    private func row(
        _ name: String,
        _ color: Color
    ) -> some View {
        HStack {
            Text(name)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.black )
            Spacer()
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(color)
                .frame(width: 44, height: 28)
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(DSColor.Slate.s200, lineWidth: 1)
                )
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(DSColor.Slate.s200, lineWidth: 1)
        )
    }
}

#Preview {
    DSColorPreview()
}
