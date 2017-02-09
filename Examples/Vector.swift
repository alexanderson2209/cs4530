//
//  Vector.swift
//  Arrows
//
//  Created by Alex Anderson on 2/7/17.
//  Copyright © 2017 Alex Anderson. All rights reserved.
//

import Foundation


//class Vector : superclass how you declare a super class

class Vector {
	var x : Float
	var y : Float
	
	init(xAxisValue px : Float, yAxisValue py : Float) {
		x = px
		y = py
	}
	
	var magnitude : Float {
		get { return sqrt(x * x + y * y) }
		set { scaleBy(scalar: newValue / magnitude) }
	}
	
	static func +(v1 : Vector, v2 : Vector) -> Vector {
		return Vector(xAxisValue: v1.x + v2.x, yAxisValue: v1.y + v2.y)
	}
	
	func scaleBy(scalar: Float) {
		x *= scalar
		y *= scalar
	}
	
	func addVector(vector : Vector) {
		x += vector.x
		y += vector.y
	}
	
	static func addVectors(v1 : Vector, v2 : Vector) -> Vector {
		return Vector(xAxisValue: v1.x + v2.x, yAxisValue: v1.y + v2.y)
	}
}

func addVectors(v1 : Vector, v2 : Vector) -> Vector {
	return Vector(xAxisValue: v1.x + v2.x, yAxisValue: v1.y + v2.y)
}
