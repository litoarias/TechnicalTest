//
//  MainContract.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 31/7/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

protocol MainView: class {
    // TODO: Declare view methods
    func showError(error: Error)
    func heroesObtained(data: VWHero)
}

protocol MainPresentation: class {
    // TODO: Declare presentation methods
    func obtainHeroData()
}

protocol MainUseCase: class {
    // TODO: Declare use case methods
    func getHeroData()
}

protocol MainInteractorOutput: class {
    // TODO: Declare interactor output methods
    func successHero(data: NTWHero)
    func failureHero(error: Error)
    
}

protocol MainWireframe: class {
    // TODO: Declare wireframe methods
}
