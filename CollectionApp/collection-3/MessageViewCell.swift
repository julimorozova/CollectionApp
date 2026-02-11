//
//  MessageViewCell.swift
//  CollectionApp
//
//  Created by Julia Morozova on 11. 2. 2026..
//

import UIKit

class MessageViewCell: UICollectionViewCell {
    static let cellId = "MessageCell"

    lazy var image: UIImageView = {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var text: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.numberOfLines = 3
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
        contentView.backgroundColor = .greyApp
        contentView.layer.cornerRadius = 15

        contentView.addSubview(image)
        contentView.addSubview(text)

        text.text = item.text
        image.image = UIImage(named: item.image)

        createConstaint()

    }

    private func createConstaint() {
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            image.heightAnchor.constraint(equalToConstant: 61),
            image.widthAnchor.constraint(equalToConstant: 61),

            text.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 13),
            text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),

            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),
        ])
    }


}
