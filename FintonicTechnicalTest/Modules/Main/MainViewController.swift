//
//  MainViewController.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 31/7/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController, StoryboardLoadable {
    
    // MARK: Properties
    
    var presenter: MainPresentation?
    var heroes: [VWSuperheroe]? = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.obtainHeroData()
    }
    
}

extension MainViewController: MainView {
    
    func heroesObtained(data: VWHero) {
        heroes = data.superheroes
        collectionView.reloadData()
    }
    
    func showError(error: Error) {
        let actions = [UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            print("Ok")
        })]
        UIAlertController.presentAlertInViewController(self, title: "Error", message: error.message, actions: actions, completion: nil)
    }
    
}

extension MainViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? HeroCollectionViewCell)!
        cell.hero = heroes?[indexPath.item]
        return cell
    }
}
