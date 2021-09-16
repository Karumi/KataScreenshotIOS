import Foundation
import SnapshotTesting
import XCTest

class ScreenshotTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // self.recordMode = ProcessInfo.processInfo.environment["RECORD_MODE"] != nil
    }

    func verify(
        viewController: UIViewController,
        _ fileName: StaticString = #file,
        _ name: String = #function
    ) {
        verify(view: viewController.view, fileName, name)
    }

    func verify(
        view: UIView,
        _ fileName: StaticString = #file,
        _ name: String = #function
    ) {
        assertSnapshot(
            matching: view,
            as: .image,
            file: fileName,
            testName: name
        )
    }
}
