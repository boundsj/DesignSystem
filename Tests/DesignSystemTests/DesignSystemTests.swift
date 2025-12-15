import XCTest
@testable import DesignSystem

final class DesignSystemTests: XCTestCase {
    func testColorTokensCompile() {
        _ = DSColor.Slate.s900
        XCTAssertTrue(true)
    }
}


