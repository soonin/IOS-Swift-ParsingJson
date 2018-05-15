//
//  Extensions.swift
//  IOS-Swift-ParsingJson
//
//  Created by Pooya Hatami on 2018-05-12.
//  Copyright © 2018 Pooya Hatami. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
//    static let lightPink = UIColor(hex: "ffc0cb", alpha: 1)
//    static let mistyRose = UIColor(hex: "ffe4e1")
//    static let dustyDarkGreen  = UIColor(hex: "008080")
//    static let lightlightPink = UIColor(hex: "d3ffce")
//    static let lightPurple = UIColor(hex: "e6e6fa")
    
//    convenience init(red : Int , green : Int , Blue: Int , alpha: CGFloat = 1.0) {
//        self.init(
//            red: CGFloat(red) / 255.0,
//            green: CGFloat(green) / 255.0,
//            blue: CGFloat(Blue) / 255.0,
//            alpha : alpha
//        )
//   }


    func quickErr(myLine: Int , inputStr : String = "" ) {
        print("===> Guard Error \(inputStr) :\n    file:\(#file)\n    line:\(myLine)\n    function:\(#function) ")
    }

}

func myQuickErr(myLine: Int , inputStr : String = "" ) {
    print("===> Guard Error \(inputStr) :\n    file:\(#file)\n    line:\(myLine)\n    function:\(#function) ")
}

