//
//  CourseViewModel.swift
//  InterviewAppStuff
//
//  Created by Yerlan on 05.12.2021.
//

import Foundation

// TODO 5

struct CourseViewModel: Codable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    var numberOfLessons: Int
    let isHighlighted: Bool
    
    init(course: Course) {
        id = course.id
        name = course.name
        link = course.link
        imageUrl = course.imageUrl
        numberOfLessons = course.numberOfLessons
        isHighlighted = course.name.contains("c")
    }
}
