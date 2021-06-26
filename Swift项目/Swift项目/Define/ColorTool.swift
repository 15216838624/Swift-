

import UIKit
func ColorRGBA(_ r:CGFloat, _ g:CGFloat, _ b:CGFloat, _ a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

func ColorHexString(_ light: String,_ dark:String = "") -> UIColor {
    if dark.count>0 {
        return dynamicColor(ColorHexString(hex: light), ColorHexString(hex: dark))
    }
    return ColorHexString(hex: light)
}

 func dynamicColor(_ light:UIColor,_ dark:UIColor) -> UIColor {
    if #available(iOS 13.0, *) {
        return  UIColor { (collection) -> UIColor in
            if (collection.userInterfaceStyle == .dark) {
                return dark
            }
            return  light
        }
    }
    return light
}

 func ColorHexString(hex: String) -> UIColor {
    let scanner = Scanner(string: hex)
    var rgbValue: UInt64 = 0
    scanner.scanHexInt64(&rgbValue)
    let r = (rgbValue & 0xff0000) >> 16
    let g = (rgbValue & 0xff00) >> 8
    let b = rgbValue & 0xff
    return UIColor.init(
        red: CGFloat(r) / 0xff,
        green: CGFloat(g) / 0xff,
        blue: CGFloat(b) / 0xff, alpha: 1
    )
}

