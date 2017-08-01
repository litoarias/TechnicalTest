//
//  MainInteractor.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 31/7/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation

class MainInteractor {

    // MARK: Properties

    weak var output: MainInteractorOutput?
}

extension MainInteractor: MainUseCase {
    // TODO: Implement use case methods
    
    func getHeroData() {
        HeroProvider().obtainItems(params: [:], success: { response in
            self.output?.successHero(data: response)
        }) {  error in
            self.output?.failureHero(error: error)
        }
    }
}
