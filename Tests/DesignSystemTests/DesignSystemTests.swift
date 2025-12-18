@testable import DesignSystem
import SwiftUI
import XCTest

final class DesignSystemTests: XCTestCase {
    func testSlateColorsPresentAndType() {
        let colors: [Color] = [
            DSColor.Slate.s50,
            DSColor.Slate.s100,
            DSColor.Slate.s200,
            DSColor.Slate.s300,
            DSColor.Slate.s400,
            DSColor.Slate.s500,
            DSColor.Slate.s600,
            DSColor.Slate.s700,
            DSColor.Slate.s800,
            DSColor.Slate.s900
        ]
        for (index, color) in colors.enumerated() {
            XCTAssertNotNil(color, "Slate color at index \(index) should not be nil")
            XCTAssertTrue(type(of: color) == Color.self, "Slate color at index \(index) should be Color")
        }
    }

    func testBackgroundColorsPresentAndType() {
        let colors: [Color] = [
            DSColor.Background.primary,
            DSColor.Background.secondary,
            DSColor.Background.tertiary
        ]
        for (index, color) in colors.enumerated() {
            XCTAssertNotNil(color, "Background color at index \(index) should not be nil")
            XCTAssertTrue(type(of: color) == Color.self, "Background color at index \(index) should be Color")
        }
    }
}

