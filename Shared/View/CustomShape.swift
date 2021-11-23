//
//  CustomShape.swift
//  UI-315 (iOS)
//
//  Created by nyannyan0328 on 2021/09/23.
//

import SwiftUI

struct CustomShape: Shape {
    var radius : CGFloat
    var corner : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
