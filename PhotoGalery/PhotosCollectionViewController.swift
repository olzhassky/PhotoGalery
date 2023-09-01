//
//  PhotosCollectionViewController.swift
//  PhotoGalery
//
//  Created by Olzhas Zhakan on 01.09.2023.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .gray
        setupCollectionView()
        setupNavigationBar() 
    }
    private func setupCollectionView() {
        collectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "CellId")
    }
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Photos"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .gray
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
}


