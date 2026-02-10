//
//  CustomCollectionViewCell.swift
//  CollectionApp
//
//  Created by Julia Morozova on 9. 2. 2026..
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let cellId = "CustomCollectionViewCell"

    lazy var userName: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var imageView: UIImageView = {
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var titleLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var dateLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var postText: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var nextBtn: UIButton = {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .greenApp
        $0.setTitle("next", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        userName.text = nil
        imageView.image = nil
        titleLabel.text = nil
        dateLabel.text = nil
        postText.text = nil

        imageView.constraints.forEach {const in
            imageView.removeConstraint(const)
        }
    }

    func setupCell(item: Post) {
        contentView.backgroundColor = .greyApp
        contentView.layer.cornerRadius = 10

        userName.text = item.authorName
        imageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        dateLabel.text = item.date
        postText.text = item.description

        contentView.addSubview(userName)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(postText)
        contentView.addSubview(nextBtn)


        createConstraints()
    }

    private func createConstraints() {
        NSLayoutConstraint.activate([
            userName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23),
            userName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),

            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 21),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 9),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),

            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),

            postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            postText.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 14),
            postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            nextBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nextBtn.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 38),
            nextBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),

            nextBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),


        ])
    }

}

extension UIImage {
    func getRatio() -> Double {
        self.size.height / self.size.width
    }
}
