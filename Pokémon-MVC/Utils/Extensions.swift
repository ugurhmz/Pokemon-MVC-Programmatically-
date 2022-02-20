

import UIKit




extension UIColor {
    
    
    static func myRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    
    // mainColor
    static func  mainColor() -> UIColor {
        return UIColor.myRGB(red: 237, green: 153, blue: 0)
    }
    
    
}
