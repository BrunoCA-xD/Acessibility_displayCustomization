//
//  UIFont+DynamicTypes.swift
//  AutolayoutTableViewCell
//
//  Created by Lucas Antevere Santana on 25/01/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    
    static func regularAppFont(withSize size: CGFloat) -> UIFont {
        
        if let customFont = UIFont(name: "Montserrat", size: size) {
            return customFont
            
        } else {
            print("Warning, custom font was not loaded")
            
            return UIFont.systemFont(ofSize: size)
        }
    }
//    
    static func boldAppFont(withSize size: CGFloat) -> UIFont {
        
        let familyDescriptor = UIFontDescriptor(name: "Montserrat", size: size)
        
        if let boldFamilyDescriptor = familyDescriptor.withSymbolicTraits(.traitBold) {
            
            let customFont = UIFont(descriptor: boldFamilyDescriptor, size: size)
            
            return customFont
            
        } else {
            
            print("Warning, custom bold font was not loaded")
            
            return UIFont.boldSystemFont(ofSize: size)
        }
    }
//    
//    
    static func dynamicAppFont(withTextSytle textStyle: UIFont.TextStyle) -> UIFont {
        
        let systemFontSytleDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
        
        var textStyleDescription = UIFontDescriptor(name: "Montserrat", size: systemFontSytleDescriptor.pointSize)
        
        if textStyle == .headline, let boldStyleDescription = textStyleDescription.withSymbolicTraits(.traitBold) {
            textStyleDescription = boldStyleDescription
        }
        
        let customFont = UIFont(descriptor: textStyleDescription, size: textStyleDescription.pointSize)
        
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: customFont)
    }
    
    static func dynamicBoldAppFont(withTextSytle textStyle: UIFont.TextStyle) -> UIFont {
        
        let systemFontSytleDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
        
        var textStyleDescription = UIFontDescriptor(name: "Montserrat", size: systemFontSytleDescriptor.pointSize)
        
        if let boldStyleDescription = textStyleDescription.withSymbolicTraits(.traitBold) {
            textStyleDescription = boldStyleDescription
        }
        
        let customFont = UIFont(descriptor: textStyleDescription, size: textStyleDescription.pointSize)
        
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: customFont)
    }
    
    
}
