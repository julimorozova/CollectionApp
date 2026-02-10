//
//  CollectionData.swift
//  CollectionApp
//
//  Created by Julia Morozova on 9. 2. 2026..
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let authorName: String
    let imageName: String
    let title: String
    let date: String
    let description: String
}

extension Post {
    static func getPosts() -> [Post] {
        return [
            Post(
                authorName: "Julian Howard",
                imageName: "customImage1",
                title: "Mid-Century Modernism",
                date: "November 20, 2024",
                description: "Exploring the iconic desert architecture of Palm Springs today. There's something timeless about how these clean lines blend with the rugged mountain backdrop."
            ),
            Post(
                authorName: "Elena Sterling",
                imageName: "customImage2",
                title: "Golden Hour in the Kitchen",
                date: "November 19, 2024",
                description: "The way the light hits the tiles at 4 PM makes even the simplest chores feel poetic. Captured this quiet moment while preparing some fresh ginger tea."
            ),
            Post(
                authorName: "Julian Howard",
                imageName: "customImage1",
                title: "Mid-Century Modernism",
                date: "November 20, 2024",
                description: "Exploring the iconic desert architecture of Palm Springs today. There's something timeless about how these clean lines blend with the rugged mountain backdrop."
            ),
            Post(
                authorName: "Elena Sterling",
                imageName: "customImage2",
                title: "Golden Hour in the Kitchen",
                date: "November 19, 2024",
                description: "The way the light hits the tiles at 4 PM makes even the simplest chores feel poetic. Captured this quiet moment while preparing some fresh ginger tea."
            ),
            Post(
                authorName: "Julian Howard",
                imageName: "customImage1",
                title: "Mid-Century Modernism",
                date: "November 20, 2024",
                description: "Exploring the iconic desert architecture of Palm Springs today. There's something timeless about how these clean lines blend with the rugged mountain backdrop."
            ),
            Post(
                authorName: "Elena Sterling",
                imageName: "customImage2",
                title: "Golden Hour in the Kitchen",
                date: "November 19, 2024",
                description: "The way the light hits the tiles at 4 PM makes even the simplest chores feel poetic. Captured this quiet moment while preparing some fresh ginger tea."
            ),
            Post(
                authorName: "Julian Howard",
                imageName: "customImage1",
                title: "Mid-Century Modernism",
                date: "November 20, 2024",
                description: "Exploring the iconic desert architecture of Palm Springs today. There's something timeless about how these clean lines blend with the rugged mountain backdrop."
            ),
            Post(
                authorName: "Elena Sterling",
                imageName: "customImage2",
                title: "Golden Hour in the Kitchen",
                date: "November 19, 2024",
                description: "The way the light hits the tiles at 4 PM makes even the simplest chores feel poetic. Captured this quiet moment while preparing some fresh ginger tea."
            )
        ]
    }
}
