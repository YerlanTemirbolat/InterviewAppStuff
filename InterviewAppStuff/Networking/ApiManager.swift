//
//  API.swift
//  InterviewAppStuff
//
//  Created by Yerlan on 02.12.2021.
//

import Foundation

// TODO 4

struct ApiManager {
    
    static let shared = ApiManager()
    
    func fetchCourses(completion: @escaping(Result<[Course], Error>) -> Void) {
        
        guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                completion(.success(courses))
                
            } catch {
                let error = error
                completion(.failure(error))
            }
        }.resume()
    }
}
