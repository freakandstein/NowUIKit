//
//  NSObject+Extension.swift
//  NowUIKit
//
//  Created by Satrio Wicaksono on 16/07/23.
//

import Foundation

extension NSObject {
    static func className() -> String {
        return String(describing: self)
    }
}
