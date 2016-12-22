//
//  SuperHeroesViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Sergio Gutiérrez on 22/12/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Nimble
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
        let _ = givenThereAreSomeSuperHeroes(1)

        let viewController = getSuperHeroDetailViewController()

        verify(viewController: viewController)
    }

    func testShowsSuperHeroesWithoutBadges() {
        let _ = givenThereAreSomeSuperHeroes()

        let viewController = getSuperHeroDetailViewController()

        verify(viewController: viewController)
    }

    func testShowsSuperHeroesWithBadges() {
        let _ = givenThereAreSomeAvengers()

        let viewController = getSuperHeroDetailViewController()

        verify(viewController: viewController)
    }

    fileprivate func givenThereAreSomeAvengers() -> [SuperHero] {
        return givenThereAreSomeSuperHeroes(avengers: true)
    }

    fileprivate func givenThereAreNoSuperHeroes() {
        _ = givenThereAreSomeSuperHeroes(0)
    }

    fileprivate func givenThereAreSomeSuperHeroes(_ numberOfSuperHeroes: Int = 10,
        avengers: Bool = false) -> [SuperHero] {
        var superHeroes = [SuperHero]()
        for i in 0..<numberOfSuperHeroes {
            let superHero = SuperHero(name: "SuperHero - \(i)",
                photo: NSURL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/60/55b6a28ef24fa.jpg") as URL?,
                isAvenger: avengers, description: "Description - \(i)")
            superHeroes.append(superHero)
        }
        repository.superHeroes = superHeroes
        return superHeroes
    }

    fileprivate func getSuperHeroDetailViewController() -> UIViewController {
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
