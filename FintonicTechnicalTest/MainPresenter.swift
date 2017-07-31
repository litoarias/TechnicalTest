//
//  MainPresenter.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 31/7/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

class MainPresenter {

    // MARK: Properties

    weak var view: MainView?
    var router: MainWireframe?
    var interactor: MainUseCase?
}

extension MainPresenter: MainPresentation {
    // TODO: implement presentation methods
    
    func obtainHeroData() {
        interactor?.getHeroData()
    }
    
}

extension MainPresenter: MainInteractorOutput {
    
    func successHero(data: NTWHero) {
        let viewModelHero = VWHero(fromDictionary: data.toJSON())
        
        if viewModelHero.superheroes.count > 0 {
            
        } else {
            failureHero(error: NSError.emptyDataError())
        }
    }

    func failureHero(error: Error) {
        self.view?.showError(error: error)
    }
}
