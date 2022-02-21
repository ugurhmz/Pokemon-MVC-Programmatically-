

import UIKit



// UIColor
extension UIColor {
    
    
    static func myRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    
    // mainColor
    static func  mainColor() -> UIColor {
        return UIColor.myRGB(red: 237, green: 153, blue: 0)
    }
    
    
}





// UIView
extension UIView {
    
    func center(inView view:UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    func anchor(top: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                paddingTop : CGFloat,
                paddingLeft : CGFloat,
                paddingBottom : CGFloat,
                paddingRight : CGFloat,
                width: CGFloat,
                height: CGFloat )
    {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height  != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
}
