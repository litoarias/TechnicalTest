//
//  MainRouter.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 31/7/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation
import UIKit

class MainRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> MainViewController {
        let viewController = UIStoryboard.loadViewController() as MainViewController
        let presenter = MainPresenter()
        let router = MainRouter()
        let interactor = MainInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension MainRouter: MainWireframe {
    // TODO: Implement wireframe methods
}
