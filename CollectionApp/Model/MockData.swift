//
//  MockData.swift
//  CollectionApp
//
//  Created by Julia Morozova on 8. 2. 2026..
//

import UIKit

struct PostData {
    let id = UUID()
    let userName: String
    let userAvatar: String
    let postImage: String
    let description: String
}

struct MockData {

    static func getPosts() -> [PostData] {
        return [
            PostData(
                userName: "James Anderson",
                userAvatar: "userAvatar1",
                postImage: "imageCard1",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non"
            ),
            PostData(
                userName: "Sophia Miller",
                userAvatar: "userAvatar2",
                postImage: "imageCard2",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non"
            ),
            PostData(
                userName: "Michael Brown",
                userAvatar: "userAvatar3",
                postImage: "imageCard3",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non"
            ),
            PostData(
                userName: "Olivia Wilson",
                userAvatar: "userAvatar4",
                postImage: "imageCard4",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non"
            ),
        ]
    }
}
