//
//  ViewController.swift
//  IOS-Swift-ParsingJson
//
//  Created by Pooya Hatami on 2018-03-10.
//  Copyright © 2018 Pooya Hatami. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses : [Course]
}

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link : String?
    let imageUrl: String?
//                // Swift 2/3/Objective C
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ??  -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//    }
}

class ViewController: UIViewController {

    
    @IBOutlet weak var readResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func readAct(_ sender: UIButton) {
        
        //let jasonUrlString = "https://raw.githubusercontent.com/soonin/IOS-Swift-ParsingJson/master/IOS-Swift-ParsingJson/course.json"
        //let jasonUrlString = "https://raw.githubusercontent.com/soonin/IOS-Swift-ParsingJson/master/IOS-Swift-ParsingJson/courses.json"
        //let jasonUrlString = "https://raw.githubusercontent.com/soonin/IOS-Swift-ParsingJson/master/IOS-Swift-ParsingJson/website_description.json"
        //let jasonUrlString = "https://raw.githubusercontent.com/soonin/IOS-Swift-ParsingJson/master/IOS-Swift-ParsingJson/courses_missing.json"
        let jasonUrlString = "https://raw.githubusercontent.com/soonin/IOS-Swift-ParsingJson/master/IOS-Swift-ParsingJson/courses_snake_case.json"
        
        
        guard  let url = URL(string: jasonUrlString)
            else { self.quickErr(myLine: #line,inputStr: "") ; return }
        
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            //perhaps check err
            //also perhaps check response
            
            guard let data = data
                else { self.quickErr(myLine: #line,inputStr: "") ; return }
            //            // Swift 4
            //            let dataString = String(data: data , encoding: .utf8)
            //            print(dataString)
            
            do {
                //let courses = try JSONDecoder().decode([Course].self , from: data)
                let websitesDes = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                
                //                // Swift 2/3/Objective C
                //                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
                //
                //                let course = Course(json: json)
                //                print(course.name)
                var tempStr = "name: " + websitesDes.name + "\n" // courses.description
                tempStr += "description: " + websitesDes.description + "\n" // courses.description
                tempStr += "courses: " + websitesDes.courses.description // courses.description
                
//                for anItem in courses  {
//                    tempStr += String(anItem.id) + anItem.name + "\n"
//                }
                
                DispatchQueue.main.async {
                    self.readResult!.text = tempStr
                }
                
            } catch let jsonErr {
                print("Error serializing json :",jsonErr)
            }
            
            
            }.resume()
        
        //        let myCourse =  Course(id: 1, name: "my Course", link: "some Link", imageUrl: "Some image url")
        //        print(myCourse)
        
        
    }
    
    
}

