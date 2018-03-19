//
//  ViewController.swift
//  IOS-Swift-ParsingJson
//
//  Created by Pooya Hatami on 2018-03-10.
//  Copyright © 2018 Pooya Hatami. All rights reserved.
//

import UIKit

struct Course: Decodable {
    let id: Int
    let name: String
    let link : String
    let imageUrl: String

//                // Swift 2/3/Objective C
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ??  -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let jasonUrlString = "https://raw.githubusercontent.com/soonin/IOS-Swift-ParsingJson/master/IOS-Swift-ParsingJson/courses.json"
        guard  let url = URL(string: jasonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            //perhaps check err
            //also perhaps check response
            
            guard let data = data else {return}

//            // Swift 4
//            let dataString = String(data: data , encoding: .utf8)
//            print(dataString)
            
            do {
                let courses = try JSONDecoder().decode([Course].self , from: data)
                print(courses)
//                // Swift 2/3/Objective C
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
//
//                let course = Course(json: json)
//                print(course.name)

            } catch let jsonErr {
                print("Error serializing json :",jsonErr)
            }

            
        }.resume()
        
//        let myCourse =  Course(id: 1, name: "my Course", link: "some Link", imageUrl: "Some image url")
//        print(myCourse)
    
    }

}

