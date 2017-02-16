//
//  KnobView.swift
//  Arrows
//
//  Created by Alex Anderson on 2/9/17.
//  Copyright © 2017 Alex Anderson. All rights reserved.
//

import UIKit

protocol knobDelegate: class {
	func knobChanged(knob: KnobView, rotatedToAngle angle : CGFloat)
}

class KnobView : UIControl {
	private var _knobRect : CGRect = CGRect.zero
	private var _angle : CGFloat = 0.0
	weak var knobChangedDelegate : knobDelegate? = nil
	
	override func draw(_ rect: CGRect) {
		_knobRect = CGRect(x: 0.0, y: (bounds.height - bounds.width) / 2, width: bounds.width, height: bounds.width)
		let context : CGContext = UIGraphicsGetCurrentContext()!
		
		var nibRect : CGRect = CGRect(x: 0.0, y: 0.0, width: _knobRect.width * 0.2, height: _knobRect.height * 0.2)
		nibRect.origin.y = (_knobRect.height * 0.35) * sin(angle) + _knobRect.midY - (nibRect.height / 2)
		nibRect.origin.x = (_knobRect.width * 0.35) * cos(angle) + _knobRect.midX - (nibRect.width / 2)
		
		
		
		context.setFillColor(UIColor.lightGray.cgColor)
		context.addEllipse(in: _knobRect)
		context.drawPath(using: .fill)
		
		context.setFillColor(UIColor.darkGray.cgColor)
		context.addEllipse(in: nibRect)
		context.drawPath(using: .fill)
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch : UITouch = touches.first!
		let touchPoint : CGPoint = touch.location(in: self)
		
		
		
		let point : CGPoint = CGPoint(x: touchPoint.x - _knobRect.midX, y: touchPoint.y - _knobRect.midY)
		
		angle = atan2(point.y, point.x)
		
		
		knobChangedDelegate?.knobChanged(knob: self, rotatedToAngle: angle)
		//NSLog("X: %f Y: \(point.y) Theta: \(angle)",point.x)
	}
	
	var angle : CGFloat {
		get {
			return _angle
		}
		set {
			_angle = newValue
			setNeedsDisplay()
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch : UITouch = touches.first!
		let touchPoint : CGPoint = touch.location(in: self)
		//NSLog("X: %f Y: \(touchPoint.x)", touchPoint.x, touchPoint.y)
	}
}
