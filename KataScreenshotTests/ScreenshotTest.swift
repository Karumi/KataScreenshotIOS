//
//  ScreenshotTest.swift
//  KataScreenshot
//
//  Created by Sergio Gutiérrez on 22/12/16.
//  Copyright © 2016 Karumi. All rights reserved.
//

import Foundation
import FBSnapshotTestCase

class ScreenshotTest: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        self.recordMode = ProcessInfo.processInfo.environment["RECORD_MODE"] != nil
    }

    func verify(viewController: UIViewController) {
        verify(view: viewController.view)
    }

    func verify(view: UIView) {
        FBSnapshotVerifyView(view)
    }
}
