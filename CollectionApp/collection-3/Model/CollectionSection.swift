//
//  CollectionSection.swift
//  CollectionApp
//
//  Created by Julia Morozova on 11. 2. 2026..
//


import Foundation

struct CollectionItem: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    var header: String? = nil
    var name: String? = nil
    var text: String? = nil
    var date: String? = nil
}

struct CollectionSection: Identifiable {
    let id: String = UUID().uuidString
    let items: [CollectionItem]

    static func mockData() -> [CollectionSection] {

        let storyItems = [
            CollectionItem(image: "customImage1", name: "Julian Howard"),
            CollectionItem(image: "customImage2", name: "Elena Sterling"),
            CollectionItem(image: "customImage1", name: "Marcus Thorne"),
            CollectionItem(image: "customImage2", name: "Sophia Reed"),
            CollectionItem(image: "customImage1", name: "Julian Howard"),
            CollectionItem(image: "customImage2", name: "Elena Sterling"),
        ]

        let messageItems = [
            CollectionItem(image: "customImage1", text: "New architectural trends in 2026 are mind-blowing..."),
            CollectionItem(image: "customImage2", text: "Check out this amazing coffee spot in downtown."),
            CollectionItem(image: "customImage1", text: "New architectural trends in 2026 are mind-blowing..."),
            CollectionItem(image: "customImage2", text: "Check out this amazing coffee spot in downtown."),
            CollectionItem(image: "customImage1", text: "New architectural trends in 2026 are mind-blowing..."),
        ]

        let newsItems = [
            CollectionItem(image: "banner", header: "The Future of Design", text: "Minimalism meets nature in the new city park project."),
            CollectionItem(image: "banner", header: "Desert Oasis", text: "A deep dive into Palm Springs' hidden gems."),
            CollectionItem(image: "banner", header: "The Future of Design", text: "Minimalism meets nature in the new city park project."),
        ]

        let bannerItems = [
            CollectionItem(image: "customImage1"),
            CollectionItem(image: "customImage2"),
            CollectionItem(image: "customImage1"),
        ]

        return [
            CollectionSection(items: storyItems),
            CollectionSection(items: messageItems),
            CollectionSection(items: newsItems),
            CollectionSection(items: bannerItems),
        ]
    }
}


