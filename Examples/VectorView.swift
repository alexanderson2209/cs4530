//
//  VectorView.swift
//  Arrows
//
//  Created by Alex Anderson on 2/7/17.
//  Copyright © 2017 Alex Anderson. All rights reserved.
//

import UIKit

class VectorView : UIView {
	override func draw(_ rect: CGRect) {
		let context : CGContext = UIGraphicsGetCurrentContext()!
		context.move(to: CGPoint(x: 10.0, y: 10.0))
		context.addLine(to: CGPoint(x: 100.0, y: 200.0))
		context.addQuadCurve(to: CGPoint(x : 50.0, y : 100.0), control: CGPoint(x : 300.0, y: 200.00))
		context.drawPath(using: CGPathDrawingMode.fill)
	}
	
	var vectors : [Vector] = []
}
