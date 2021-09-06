import UIKit
import XCTest

@testable import KataScreenshot

class SuperHeroTableViewCellTests: ScreenshotTest {

    func testShowsAnySuperHero() {
        let cell = givenASuperHeroTableViewCell()

        cell.configure(forItem: SuperHeroMother.givenASuperHero(isAvenger: false))

        verify(view: cell)
    }

}

private extension SuperHeroTableViewCellTests {
    func givenASuperHeroTableViewCell() -> SuperHeroTableViewCell {
        return UINib(nibName: "SuperHeroTableViewCell", bundle: Bundle.main).instantiate(withOwner: self, options: nil)[0] as! SuperHeroTableViewCell
    }
}
