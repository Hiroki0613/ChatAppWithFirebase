//
//  UIColor-Extention.swift
//  ChatAppWithFirebase
//
//  Created by 近藤宏輝 on 2020/07/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
