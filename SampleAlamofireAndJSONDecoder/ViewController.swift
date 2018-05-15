//
//  ViewController.swift
//  SampleAlamofireAndJSONDecoder
//
//  Created by SungYu on 2018. 5. 15..
//  Copyright © 2018년 SungYu. All rights reserved.
//

import UIKit
import Alamofire

struct Course: Decodable {
    let name: String
    let numberOfLessons: Int
    
    // Swift 4.0
//    private enum CodingKeys: String, CodingKey {
//        case numberOfLessons = "number_of_lessons"
//        case name
//    }
}

class ViewController: UIViewController {

    let restUrl = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses_snake_case")
    var courses = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(restUrl!).responseJSON { (response) in
            let result = response.data
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                self.courses = try jsonDecoder.decode([Course].self, from: result!)
                for courses in self.courses {
                    print("\(courses.name) : \(courses.numberOfLessons)")
                }
            } catch let jsonError{
                print("error: \(jsonError)")
            }
        }
    }
    
}

