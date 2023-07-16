//
//  UIFont.swift
//  NowUIKit
//
//  Created by Satrio Wicaksono on 16/07/23.
//

import UIKit

extension UIFont {
    public enum InterType: String {
        case semibold = "-SemiBold"
        case regular = "-Regular"
        case light = "-Light"
        case extraBold = "-ExtraBold"
        case bold = "-Bold"
        case medium = "-Medium"
    }

    static func Inter(type: InterType, size: CGFloat) -> UIFont {
        return UIFont(name: "Inter\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
}

