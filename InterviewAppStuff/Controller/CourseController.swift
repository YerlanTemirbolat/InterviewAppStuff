//
//  CourseController.swift
//  InterviewAppStuff
//
//  Created by Yerlan on 02.12.2021.
//

import UIKit

// Todo 2

class CourseController: UITableViewController {
    
    fileprivate let cellId = "cell"
    private let isEnabled: Bool = true
    
    var courses = [Course]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Courses"
        
        configureUI()
        fetchData()
    }
    
    func configureUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchData() {
        Service.shared.fetchData { data in
            self.courses = data
        }
    }
}

extension CourseController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let course = courses[indexPath.row]
        let courseName = course.name
        //cell.textLabel?.text = courseName
        if isEnabled {
            cell.textLabel?.text = courseName.uppercased()
        }
        return cell
    }
}

