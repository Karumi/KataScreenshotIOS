import Foundation
import SnapshotTesting
import XCTest

class ScreenshotTest: XCTestCase {
    private var shouldRecord: Bool = false
    
    override func setUp() {
        super.setUp()
        self.shouldRecord = ProcessInfo.processInfo.environment["RECORD_MODE"] != nil
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
            record: shouldRecord,
            file: fileName,
            testName: name
        )
    }
}
