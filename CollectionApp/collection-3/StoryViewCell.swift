//
//  StoryViewCell.swift
//  CollectionApp
//
//  Created by Julia Morozova on 11. 2. 2026..
//

import UIKit

class StoryViewCell: UICollectionViewCell {
    static let cellId: String = "StoryCell"

    lazy var cellImage: UIImageView = {
        $0.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 80)
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    lazy var cellLabel: UILabel = {
        $0.frame = CGRect(x: 0, y: cellImage.frame.maxY + 5, width: bounds.width, height: 20)
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(item: CollectionItem) {

        contentView.addSubview(cellImage)
        contentView.addSubview(cellLabel)

        cellImage.image = UIImage(named: item.image)
        cellLabel.text = item.name
    }
}
