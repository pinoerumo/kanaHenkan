//
//  UIColor+hexColor.swift
//  kanaHenkan
//
//  Created by boko on 2020/03/16.
//  Copyright © 2020 boko. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(hexStr: String, alpha: CGFloat) {
        let hexString = hexStr.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexString)
        var color: UInt64 = 0
        if scanner.scanHexInt64(&color) {
            let red = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(color & 0x0000FF) / 255.0
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            print("invalid hex string")
            self.init()
        }
    }
}
