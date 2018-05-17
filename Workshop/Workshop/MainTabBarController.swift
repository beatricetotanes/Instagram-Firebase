//
//  MainTabBarController.swift
//  Workshop
//
//  Created by Beatrice Totanes on 17/05/2018.
//  Copyright © 2018 Bea. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController()
            (collectionViewLayout: layout)
        
        let navController = UINavigationController(rootViewController: userProfileController)
        
        viewControllers = [navController]
    }
}
