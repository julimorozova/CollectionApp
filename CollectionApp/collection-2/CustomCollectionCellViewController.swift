//
//  CustomCollectionCellViewController.swift
//  CollectionApp
//
//  Created by Julia Morozova on 9. 2. 2026..
//

import UIKit

class CustomCollectionCellViewController: UIViewController {

    let data = Post.getPosts()

    lazy var layout: UICollectionViewFlowLayout = {
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 38
        return $0
    }(UICollectionViewFlowLayout())

    lazy var collectionView: UICollectionView = {
        $0.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.cellId)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(collectionView)
    }

}

extension CustomCollectionCellViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.cellId, for: indexPath) as! CustomCollectionViewCell
        cell.setupCell(item: data[indexPath.item])
        return cell
    }
    

}
