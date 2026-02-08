//
//  ViewController.swift
//  CollectionApp
//
//  Created by Julia Morozova on 5. 2. 2026..
//

import UIKit

class ViewController: UIViewController {

    let items = MockData.getPosts()

    lazy var layout: UICollectionViewFlowLayout = {
        $0.itemSize = CGSize(width: (view.frame.width - 57) / 2, height: 216)
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 10 // vertical
        $0.minimumInteritemSpacing = 17
        $0.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return $0
    }(UICollectionViewFlowLayout())

    lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(CellCollectionViewCell.self, forCellWithReuseIdentifier: CellCollectionViewCell.cellId)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(collectionView)

        createConstaraints()
    }

    func createConstaraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionViewCell.cellId, for: indexPath) as! CellCollectionViewCell
        cell.setupCell(item: items[indexPath.item])

        let action = UIAction { [weak self] _ in
            guard self != nil else { return }

            guard let currentPost = self?.items[indexPath.item] else { return }

            let detailVC = DetailsViewController(data: currentPost)
            self?.navigationController?.pushViewController(detailVC, animated: true)
        }

        cell.moreButton.addAction(action, for: .touchUpInside)


        return cell
    }
    

}

