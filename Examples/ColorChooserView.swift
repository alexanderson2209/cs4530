//
//  ColorChooserView.swift
//  Arrows
//
//  Created by Alex Anderson on 2/9/17.
//  Copyright © 2017 Alex Anderson. All rights reserved.
//

import UIKit

class ColorChooserView : UIView {
	
	private var _knobViewRed : KnobView? = nil
	private var _knobViewBlue : KnobView? = nil
	private var _knobViewGreen : KnobView? = nil
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		_knobViewRed = KnobView()
		_knobViewRed?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 400.0)
		_knobViewRed?.backgroundColor = UIColor.red
		addSubview(_knobViewRed!)
		
		_knobViewBlue = KnobView()
		_knobViewBlue?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 400.0)
		_knobViewBlue?.backgroundColor = UIColor.blue
		addSubview(_knobViewBlue!)
		
		_knobViewGreen = KnobView()
		_knobViewGreen?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 400.0)
		_knobViewGreen?.backgroundColor = UIColor.green
		addSubview(_knobViewGreen!)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	var knobViewRed : KnobView? { return _knobViewRed }
	var knobViewGreen : KnobView? { return _knobViewGreen }
	var knobViewBlue : KnobView? { return _knobViewBlue }
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		var r: CGRect = bounds
		let width: CGFloat = r.width
		(_knobViewRed!.frame, r) = r.divided(atDistance: width * 0.25, from: .minXEdge)
		(_knobViewBlue!.frame, r) = r.divided(atDistance: width * 0.666, from: .minXEdge)
		(_knobViewGreen!.frame, r) = r.divided(atDistance: width * 1, from: .minXEdge)
		
	}
}
