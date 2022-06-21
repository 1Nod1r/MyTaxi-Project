//
//  Extensions.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import Foundation
import UIKit
// MARK: UIColor
extension UIColor {
    
  convenience init(hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
        self.init(hex:"ff0000") // return red color for wrong hex input
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}

// MARK: UIView

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach { addSubview($0) }
    }
}