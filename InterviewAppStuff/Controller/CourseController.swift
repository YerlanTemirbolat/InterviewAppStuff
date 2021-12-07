//
//  CourseController.swift
//  InterviewAppStuff
//
//  Created by Yerlan on 02.12.2021.
//

import UIKit

// TODO 2

class CourseController: UITableViewController {
    
    let cellId = "cellId"
    private let isEnabled: Bool = true
    var api: ApiManager = .shared                   // property injection

    var courseViewModels = [CourseViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        setupNavBar()
        setupTableView()
    }
    
    func fetchData() {
        api.fetchCourses { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let course):
                DispatchQueue.main.async {
                    //self.courseViewModels = course.map(CourseViewModel.init)
                    self.courseViewModels = course.map({ return CourseViewModel(course: $0) })
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CourseCell
        
        let courseViewModel = courseViewModels[indexPath.row]
        cell.courseViewModel = courseViewModel
        
        return cell
    }
    
    fileprivate func setupTableView() {
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .darkGray
        tableView.backgroundColor = #colorLiteral(red: 0.9950950742, green: 1, blue: 0.9999566674, alpha: 1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupNavBar() {
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Courses"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
    }
}
