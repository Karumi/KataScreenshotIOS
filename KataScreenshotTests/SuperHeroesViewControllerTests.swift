import UIKit

@testable import KataScreenshot

class SuperHeroesViewControllerTests: ScreenshotTest {
    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsEmptyCase() {
        givenThereAreNoSuperHeroes()

        let viewController = getSuperHeroDetailViewController()

        verify(viewController: viewController)
    }

    func testShowsOneSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes(1)

        let viewController = getSuperHeroDetailViewController()

        verify(viewController: viewController)
    }

    func testShowsSuperHeroesWithoutBadges() {
        _ = givenThereAreSomeSuperHeroes()

        let viewController = getSuperHeroDetailViewController()

        verify(viewController: viewController)
    }

    func testShowsSuperHeroesWithBadges() {
        _ = givenThereAreSomeAvengers()

        let viewController = getSuperHeroDetailViewController()

        verify(viewController: viewController)
    }
}

private extension SuperHeroesViewControllerTests {
    func givenThereAreSomeAvengers() -> [SuperHero] {
        return givenThereAreSomeSuperHeroes(avengers: true)
    }

    func givenThereAreNoSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes(0)
    }

    func givenThereAreSomeSuperHeroes(_ numberOfSuperHeroes: Int = 10,
                                      avengers: Bool = false) -> [SuperHero]
    {
        var superHeroes = [SuperHero]()
        for i in 0 ..< numberOfSuperHeroes {
            let superHero = SuperHero(name: "SuperHero - \(i)",
                                      photo: URL(string: ""),
                                      isAvenger: avengers, description: "Description - \(i)")
            superHeroes.append(superHero)
        }
        repository.superHeroes = superHeroes
        return superHeroes
    }

    func getSuperHeroDetailViewController() -> UIViewController {
        let superHeroesViewController = ServiceLocator()
            .provideSuperHeroesViewController() as! SuperHeroesViewController
        superHeroesViewController.presenter = SuperHeroesPresenter(
            ui: superHeroesViewController,
            getSuperHeroes: GetSuperHeroes(repository: repository)
        )

        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroesViewController]

        return rootViewController
    }
}
