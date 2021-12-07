//
//  CourseViewModel.swift
//  InterviewAppStuff
//
//  Created by Yerlan on 05.12.2021.
//

import Foundation
import UIKit

// TODO 5

struct CourseViewModel {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    var numberOfLessons: Int
    
    
    let isHighlighted: Bool
    let detailTextString: String
    let accessoryType: UITableViewCell.AccessoryType
    
    
    // Dependency Injection
    init(course: Course) {
        id = course.id
        name = course.name
        link = course.link
        imageUrl = course.imageUrl
        numberOfLessons = course.numberOfLessons
        
        isHighlighted = course.name.contains("c")
        
        if course.numberOfLessons > 35 {
            detailTextString = "Lessons 30+ Check it Out!"
            accessoryType = .detailDisclosureButton
        } else {
            detailTextString = "Lessons: \(course.numberOfLessons)"
            accessoryType = .none
        }
    }
}
