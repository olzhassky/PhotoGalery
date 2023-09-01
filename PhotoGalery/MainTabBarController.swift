//
//  MainTabBarController.swift
//  PhotoGalery
//
//  Created by Olzhas Zhakan on 01.09.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
      
        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Photos", image: #imageLiteral(resourceName: "photos") ),
            generateNavigationController(rootViewController: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "heart"))
        ]
    }
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
