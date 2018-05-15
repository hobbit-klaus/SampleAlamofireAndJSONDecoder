//
//  ViewController.swift
//  SampleAlamofireAndJSONDecoder
//
//  Created by SungYu on 2018. 5. 15..
//  Copyright © 2018년 SungYu. All rights reserved.
//

import UIKit
import Alamofire

struct Country: Decodable {
    let name: String
    let capital: String
}

class ViewController: UIViewController {

    let restUrl = URL(string: "https://restcountries.eu/rest/v2/all")
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(restUrl!).responseJSON { (response) in
            let result = response.data
            do {
                self.countries = try JSONDecoder().decode([Country].self, from: result!)
                for country in self.countries {
                    print("\(country.name) : \(country.capital)")
                }
            } catch {
                print("error")
            }
        }
    }
    
}

