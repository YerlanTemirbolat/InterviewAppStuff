//
//  API.swift
//  InterviewAppStuff
//
//  Created by Yerlan on 02.12.2021.
//

import Foundation

// Todo 4

struct Service {
    
    static let shared = Service()
    
    func fetchData(completion: @escaping([Course]) -> Void) {
        
        guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            print("Data: \(data)")
            
            do {
                let courseData = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    completion(courseData)
                }
            } catch {
                let error = error
                print("\(error.localizedDescription)")
            }
        }.resume()
    }
}
