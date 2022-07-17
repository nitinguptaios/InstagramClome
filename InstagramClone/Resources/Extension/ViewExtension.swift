//
//  File.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 30/04/22.
//

import Foundation
import UIKit

//extension to find out width, height, leading, trailing, top and bottom
extension UIView {
    
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var leading: CGFloat {
        return frame.origin.x
    }
    
    public var trailing: CGFloat {
        return leading + width
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        return top + height
    }
}
