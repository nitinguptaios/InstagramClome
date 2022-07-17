//
//  CurvedView.swift
//  InstagramClone
//
//  Created by Nitin Gupta on 30/04/22.
//

import Foundation
import UIKit

//class for making a view that is sin curved from bottom
class CurvedView: UIView{
    func getCurvedView() -> CAShapeLayer{
        let path = UIBezierPath()
        let fillColor = UIColor(named: "curvedViewColor")
        
        let y: CGFloat = UIScreen.main.bounds.size.height
        let x: CGFloat = UIScreen.main.bounds.size.width
        let height: CGFloat = 650
        
        path.move(to: CGPoint(x: 0, y: y)) // bottom left
        path.addLine(to: CGPoint(x: 0, y: y - 700)) // top left
        path.addCurve(to: CGPoint(x: x, y: y - height), controlPoint1: CGPoint(x: x * 0.45, y: y - 380), controlPoint2: CGPoint(x: x * 0.7, y: y - height * 6 / 5)) // curve to top right
        path.addLine(to: CGPoint(x: x, y: y)) // bottom right
        path.close() // close the path from bottom right to bottom left
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = fillColor?.cgColor
        return shapeLayer
    }
}
