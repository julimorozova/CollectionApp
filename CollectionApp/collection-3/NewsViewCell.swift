//
//  NewsViewCell.swift
//  CollectionApp
//
//  Created by Julia Morozova on 11. 2. 2026..
//

import UIKit

class NewsViewCell: UICollectionViewCell {
    static let cellId = "NewsCell"

    lazy var banner: UIImageView = {
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var title: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 24, weight: .black)
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var descriptionLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.numberOfLines = 2
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(item: CollectionItem) {
        contentView.layer.cornerRadius = 15

        contentView.addSubview(banner)
        contentView.addSubview(title)
        contentView.addSubview(descriptionLabel)

        banner.image = UIImage(named: item.image)
        title.text = item.header
        descriptionLabel.text = item.text

        createConstraints()

    }

    private func createConstraints() {
        NSLayoutConstraint.activate([
            banner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            banner.topAnchor.constraint(equalTo: contentView.topAnchor),
            banner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            banner.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            //тут надо задавать констрейнты от banner или от contentView?
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descriptionLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 41),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }


}
