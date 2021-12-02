//
//  Course.swift
//  InterviewAppStuff
//
//  Created by Yerlan on 02.12.2021.
//

import UIKit

// Todo 3

struct Course: Codable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    var numberOfLessons: Int
}
