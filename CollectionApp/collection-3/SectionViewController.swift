//
//  SectionViewController.swift
//  CollectionApp
//
//  Created by Julia Morozova on 11. 2. 2026..
//

import UIKit

class SectionViewController: UIViewController {

    private let data = CollectionSection.mockData()

    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(StoryViewCell.self, forCellWithReuseIdentifier: StoryViewCell.cellId)
        $0.register(MessageViewCell.self, forCellWithReuseIdentifier: MessageViewCell.cellId)
        $0.register(NewsViewCell.self, forCellWithReuseIdentifier: NewsViewCell.cellId)
        $0.register(BannerViewCell.self, forCellWithReuseIdentifier: BannerViewCell.cellId)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground


        view.addSubview(collectionView)

    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:
               return self.createStorySection()
            case 1:
                return self.createMessageSection()
            case 2:
                return self.createNewsSection()
            case 3:
                return self.createBannerSection()
            default:
                return self.createEmptySection()
            }
        }
    }

    private func createStorySection() -> NSCollectionLayoutSection {
        // 1 item
        let itemSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // 2 group

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100),
                                               heightDimension: .absolute(104))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 20)
        // 3 section

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 30, bottom: 46, trailing: 30)

        return section
    }

    private func createMessageSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 12, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(343),
                                               heightDimension: .estimated(98))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 20)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = .init(top: 0, leading: 30, bottom: 46, trailing: 30)

        return section
    }

    private func createNewsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(343),
                                               heightDimension: .absolute(152))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 20)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging

        section.contentInsets = .init(top: 0, leading: 30, bottom: 46, trailing: 30)
        return section
    }

    private func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(240))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 24, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 30, bottom: 46, trailing: 30)

        return section
    }

    private func createEmptySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(0.1), heightDimension: .absolute(0.1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(0.1), heightDimension: .absolute(0.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        return NSCollectionLayoutSection(group: group)
    }

}

extension SectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = data[indexPath.section].items[indexPath.item]
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryViewCell.cellId, for: indexPath) as! StoryViewCell
            cell.setupCell(item: item)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageViewCell.cellId, for: indexPath) as! MessageViewCell
            cell.setupCell(item: item)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsViewCell.cellId, for: indexPath) as! NewsViewCell
            cell.setupCell(item: item)
            return cell

        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerViewCell.cellId, for: indexPath) as! BannerViewCell
            cell.setupCell(item: item)
            return cell
        default:
            return UICollectionViewCell()
        }

    }
    

}

