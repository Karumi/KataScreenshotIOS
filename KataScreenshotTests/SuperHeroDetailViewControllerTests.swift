//
//  SuperHeroDetailViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Sergio Gutiérrez on 22/12/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
@testable import KataScreenshot

class SuperHeroDetailViewControllerTests: ScreenshotTest {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsSuperHeroWithNoBadge() {
        let superHero = givenASuperHero(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)

        verify(viewController: viewController)
    }

    func testShowsSuperHeroWithBadge() {
        let superHero = givenASuperHero(isAvenger: true)

        let viewController = getSuperHeroDetailViewController(superHero.name)

        verify(viewController: viewController)
    }

    func givenASuperHero(isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(isAvenger: isAvenger)
        repository.superHeroes = [superHero]
        return superHero
    }

    fileprivate func getSuperHeroDetailViewController(_ superHeroName: String) -> UIViewController {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(
            ui: superHeroDetailViewController,
            superHeroName: superHeroName,
            getSuperHeroByName: GetSuperHeroByName(repository: repository)
        )

        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroDetailViewController]

        return rootViewController
    }
}
