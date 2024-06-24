//
//  CircularProgressView.swift
//  RateMovies
//
//

import UIKit

class CircularProgressView: UIView {
    
    var percentage: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let centerX = rect.width / 2
        let centerY = rect.height / 2
        
        let radius = min(centerX, centerY) - 10
        
        context.setFillColor(UIColor.white.cgColor)
        context.fill(rect)
        
        let endAngle = -CGFloat.pi / 2 + 2 * CGFloat.pi * (percentage / 100)
        context.setFillColor(UIColor.base300.cgColor)
        context.move(to: CGPoint(x: centerX, y: centerY))
        context.addArc(center: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: -CGFloat.pi / 2, endAngle: endAngle, clockwise: false)
        context.fillPath()
        
        let percentageString = "\(Int(percentage))%"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.black
        ]
        let textSize = percentageString.size(withAttributes: attributes)
        let textRect = CGRect(x: centerX - textSize.width / 2, y: centerY - textSize.height / 2, width: textSize.width, height: textSize.height)
        percentageString.draw(in: textRect, withAttributes: attributes)
    }
}
