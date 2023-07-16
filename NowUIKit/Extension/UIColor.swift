//
//  UIColor.swift
//  NowUIKit
//
//  Created by Satrio Wicaksono on 16/07/23.
//

import UIKit

extension UIColor {
    
    //Primary
    
    static var primary0: UIColor {
        return UIColor(hex: 0xECF5FE)
    }
    
    static var primary10: UIColor {
        return UIColor(hex: 0xCEE6FC)
    }
    
    static var primary30: UIColor {
        return UIColor(hex: 0x419CF3)
    }
    
    static var primary50: UIColor {
        return UIColor(hex: 0x0C80EF)
    }

    static var primary70: UIColor {
        return UIColor(hex: 0x0A66BF)
    }
    
    //Secondary
    
    static var secondary0: UIColor {
        return UIColor(hex: 0xFCE78C)
    }
    
    static var secondary10: UIColor {
        return UIColor(hex: 0xFAE0DF)
    }
    
    static var secondary30: UIColor {
        return UIColor(hex: 0xFD9E93)
    }
    
    static var secondary50: UIColor {
        return UIColor(hex: 0xF8CE19)
    }

    static var secondary70: UIColor {
        return UIColor(hex: 0xC6A514)
    }
    
    //Success
    
    static var success0: UIColor {
        return UIColor(hex: 0x9BD5C3)
    }
    
    static var success10: UIColor {
        return UIColor(hex: 0x50B696)
    }
    
    static var success30: UIColor {
        return UIColor(hex: 0x10B981)
    }
    
    static var success50: UIColor {
        return UIColor(hex: 0x059669)
    }

    static var success70: UIColor {
        return UIColor(hex: 0x047854)
    }
    
    //Error
    
    static var error0: UIColor {
        return UIColor(hex: 0xF8D4D4)
    }
    
    static var error10: UIColor {
        return UIColor(hex: 0xF1A8A8)
    }
    
    static var error30: UIColor {
        return UIColor(hex: 0xE76767)
    }
    
    static var error50: UIColor {
        return UIColor(hex: 0xDC2626)
    }

    static var error70: UIColor {
        return UIColor(hex: 0xB01E1E)
    }
    
    //
    
    static var backgroundDisabledField: UIColor {
        return UIColor(hex: 0xECF1F5)
    }
    
    static var lightGrey04: UIColor {
        return UIColor(hex: 0xEBEBEB)
    }
    
    static var darkGrey: UIColor {
        return UIColor(hex: 0x6B6B6B)
    }
    
    static var background: UIColor {
        return UIColor(hex: 0xF8FBFF)
    }
    
    static var blue02: UIColor {
        return UIColor(hex: 0x419CF3)
    }
    
    static var coachmarkBg: UIColor {
        return UIColor(hex: 0x40444D)
    }
    
    static var lightGrey03: UIColor {
        return UIColor(hex: 0xDADADA)
    }
    
    static var lightGrey01: UIColor {
        return UIColor(hex: 0xB6B6B6)
    }
    
    static var lightGrey02: UIColor {
        return UIColor(hex: 0xCACACA)
    }
    
    static var backgroundWarning: UIColor {
        return UIColor(hex: 0xFFFBEB)
    }
    
    static var textWarning: UIColor {
        return UIColor(hex: 0xFFFBEB)
    }
    
    static var backgroundInfo: UIColor {
        return UIColor(hex: 0xEDF7FF)
    }
    static var yellow02: UIColor {
        return UIColor(hex: 0xF8CE19)
    }
    
    static var backgroundLoading: UIColor {
        return UIColor.black.withAlphaComponent(0.5)
    }
    
    static var skeleton: UIColor {
        return UIColor.init(hex: 0xEEEEEE)
    }
    
    static var blackText: UIColor {
        return UIColor.init(hex: 0x343434)
    }

    static var green01B14E: UIColor {
        return UIColor.init(hex: 0x01B14E)
    }
    
    static var green059669: UIColor {
        return UIColor.init(hex: 0x059669)
    }
    
    static var blueF6FBFF: UIColor {
        return UIColor.init(hex: 0xF6FBFF)
    }
    
    static var collectionBackground: UIColor {
        return UIColor.init(hex: 0xFCFCFC)
    }
    
    static var highlightColor: UIColor {
        return UIColor.init(hex: 0xF4F8FB)
    }
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff, alpha: alpha)
    }
    
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(hex: 0x000000)
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    public func lighter(_ amount: CGFloat = 0.25) -> UIColor {
        return hueColorWithBrightness(1 + amount)
    }
    
    public func darker(_ amount: CGFloat = 0.25) -> UIColor {
        return hueColorWithBrightness(1 - amount)
    }
    
    private func hueColorWithBrightness(_ amount: CGFloat) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness * amount, alpha: alpha)
        } else {
            return self
        }
    }
}

