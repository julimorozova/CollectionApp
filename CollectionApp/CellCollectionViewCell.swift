//
//  CellCollectionViewCell.swift
//  CollectionApp
//
//  Created by Julia Morozova on 8. 2. 2026..
//

import UIKit

class CellCollectionViewCell: UICollectionViewCell {

    static let cellId = "CellCollection"


    lazy var imageView: UIImageView = {
        $0.frame = CGRect(x: 6, y: 6, width: bounds.width - 12, height: 100)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    lazy var userAvatar: UIImageView = {
        $0.frame = CGRect(x: 10, y: imageView.frame.maxY + 6, width: 17, height: 17)
        $0.layer.cornerRadius = 8.5
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .red
        return $0
    }(UIImageView())

    lazy var userName: UILabel = {
        $0.frame = CGRect(x: userAvatar.frame.maxX + 5, y: imageView.frame.maxY + 6, width: bounds.width - 21 - userAvatar.bounds.width, height: 17)
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return $0
    }(UILabel())

    lazy var postLabel: UILabel = {
        $0.frame = CGRect(x: 10, y: userAvatar.frame.maxY + 7, width: bounds.width - 16, height: 30)
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.numberOfLines = 2
        return $0
    }(UILabel())

    lazy var moreButton: UIButton = {
        $0.frame =  CGRect(x: 6, y: postLabel.frame.maxY + 14, width: bounds.width - 12, height: 30)
        $0.backgroundColor = .greenApp
        $0.layer.cornerRadius = 10
        $0.setTitle("Подробнее", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return $0
    }(UIButton())

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        moreButton.removeTarget(nil, action: nil, for: .allEvents)
    }

    func setupCell(item: PostData) {
        contentView.addSubview(imageView)
        contentView.addSubview(userAvatar)
        contentView.addSubview(userName)
        contentView.addSubview(postLabel)
        contentView.addSubview(moreButton)

        imageView.image = UIImage(named: item.postImage)
        userAvatar.image = UIImage(named: item.userAvatar)
        userName.text = item.userName
        postLabel.text = item.description

    }
}
