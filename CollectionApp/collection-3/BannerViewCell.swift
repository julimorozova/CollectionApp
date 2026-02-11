//
//  BannerViewCell.swift
//  CollectionApp
//
//  Created by Julia Morozova on 11. 2. 2026..
//

import UIKit

class BannerViewCell: UICollectionViewCell {
    static let cellId = "BannerCell"

    lazy var banner: UIImageView = {
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(item: CollectionItem) {
        contentView.layer.cornerRadius = 15

        contentView.addSubview(banner)

        banner.image = UIImage(named: item.image)

        createConstraints()
    }

    private func createConstraints() {
        NSLayoutConstraint.activate([
            banner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            banner.topAnchor.constraint(equalTo: contentView.topAnchor),
            banner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            banner.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
