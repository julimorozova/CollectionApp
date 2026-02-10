//
//  DetailsViewController.swift
//  CollectionApp
//
//  Created by Julia Morozova on 8. 2. 2026..
//

import UIKit

class DetailsViewController: UIViewController {

    var data: PostData

    init(data: PostData) {
        self.data = data

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var imageView: UIImageView = {
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var userAvatar: UIImageView = {
        $0.layer.cornerRadius = 21
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var userName: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var postLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(imageView)
        view.addSubview(userAvatar)
        view.addSubview(userName)
        view.addSubview(postLabel)

        imageView.image = UIImage(named: data.postImage)
        userAvatar.image = UIImage(named: data.userAvatar)
        userName.text = data.userName
        postLabel.text = data.description


        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 247),

            userAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            userAvatar.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            userAvatar.trailingAnchor.constraint(equalTo: userName.leadingAnchor, constant: -8),
            userAvatar.widthAnchor.constraint(equalToConstant: 42),
            userAvatar.heightAnchor.constraint(equalToConstant: 42),

            userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userName.centerYAnchor.constraint(equalTo: userAvatar.centerYAnchor),

            postLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postLabel.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 18),
            postLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

        ])
    }

    deinit {
        print("closed dv")
    }

}
