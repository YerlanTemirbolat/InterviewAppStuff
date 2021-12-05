//
//  CourseController.swift
//  InterviewAppStuff
//
//  Created by Yerlan on 02.12.2021.
//

import UIKit

// TODO 2

class CourseController: UITableViewController {
    
    fileprivate let cellId = "cell"
    private let isEnabled: Bool = true
    var api: ApiManager = .shared           // property injection

    var courses = [CourseViewModel]()

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
        api.fetchData { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let courses):
                DispatchQueue.main.async {
                    self.courses = courses.map(CourseViewModel.init)
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension CourseController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let viewModel = courses[indexPath.row]
        cell.textLabel?.text = viewModel.name
        if viewModel.isHighlighted {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .white
        }
        return cell
    }
}

