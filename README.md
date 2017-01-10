![Karumi logo][karumilogo] KataScreenshot for iOS. [![Build Status](https://travis-ci.org/Karumi/KataScreenshotIOS.svg?branch=master)](https://travis-ci.org/Karumi/KataScreenshotIOS)
============================

- We are here to practice UI testing using [screenshot tests for iOS][screenshotFramework].
- We are going to use manual [Dependency Injection][dependencyInjection] to replace production code with [Test Doubles][testDoubles].
- We are going to practice pair programming.

**You can compare this testing approach with [a different testing strategy][kataSuperHeroesIOS] where the application UI is tested using KIF.**

---

## Getting started

This repository contains an iOS application showing Super Heroes information:

![ApplicationScreencast][applicationScreencast]

This Application is based on two ViewControllers:

* ``SuperHeroesViewController`` showing a list of super heroes with name, photo and a special badge if is part of the Avengers Team.

![SuperHeroesViewControllerScreenshot][superHeroesViewControllerScreenshot]

* ``SuperHeroDetailViewController`` showing detailed information for a super hero like the name, photo and description.

![SuperHeroDetailViewControllerScreenshot][superHeroDetailViewControllerScreenshot]



The application architecture, dependencies and configuration is ready to just start writing tests. In this project you'll find all the classes ready to be able to replace production code with test doubles easily and a screenshot testing framework to compare your application visual changes.

Remember that after any production code change you can record your screenshots again by changing the current scheme to `Record Screenshots`.

To verify the correct behaviour of your code just run your tests from the `KataScreenshot` scheme.


To be able to get a deterministic test scenario all our tests will be executed on the same emulated device. You can use the Travis-CI configuration to get the same emulator working on your computer.


## Tasks

Your task as an iOS Developer is to **write all the UI tests** needed to check if the Application UI is working as it should.

**This repository is ready to build the application, pass the checkstyle and your tests in Travis-CI environments.**


Our recommendation for this exercise is:

  * Before starting
    1. Fork this repository.
    2. Checkout `kata-screenshot` branch.
    3. Execute the application, explore it manually and make yourself familiar with the code.
    4. Execute `SuperHeroesViewControllerTests` and watch the only test it contains pass.

  * To help you get started, these are some test cases for `SuperHeroesViewControllerTests`:     
    1. Setup mocked `SuperHeroesRepository` in `SuperHeroesViewControllerTests` to return a list of some Super Heroes.
    2. Test that the TableView is showing the super heroes obtained from the `SuperHeroesRepository`.
    3. Test the empty case is shown if there are no super heroes.

## Considerations

* If you get stuck, `master` branch contains already solved tests for `SuperHeroesViewControllerTests` and `SuperHeroViewControllerTests`.

## Extra Tasks

If you've covered all the application functionality using UI tests try to continue with the following tasks:

* Add a pull to refresh mechanism to ``SuperHeroesViewController`` and test it.
* Modify ``SuperHeroDetailViewController`` to handle an error case where the name of the super hero used to start this ViewController does not exist and show a message if this happens.
* Modify the project to handle connection errors and show a message to indicate something went wrong.

## Documentation

There are some links which can be useful to finish these tasks:

* [Screenshot Testing Framework][screenshotFramework]

Data provided by Marvel. © 2017 MARVEL

#License

Copyright 2017 Karumi

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[karumilogo]: https://cloud.githubusercontent.com/assets/858090/11626547/e5a1dc66-9ce3-11e5-908d-537e07e82090.png
[screenshotFramework]: https://github.com/facebook/ios-snapshot-test-case/
[dependencyInjection]: http://www.martinfowler.com/articles/injection.html
[testDoubles]: http://www.martinfowler.com/bliki/TestDouble.html
[applicationScreencast]: ./art/ApplicationScreencast.gif
[superHeroesViewControllerScreenshot]: ./art/superHeroesViewControllerScreenshot.png
[superHeroDetailViewControllerScreenshot]: ./art/superHeroDetailViewControllerScreenshot.png
[toolbarMatcher]: http://blog.sqisland.com/2015/05/espresso-match-toolbar-title.html
[kataSuperHeroesIOS]: https://github.com/karumi/KataSuperHeroesIOS
