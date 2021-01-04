import Foundation

struct Vector{
	var dX: CGFloat;
	var dY: CGFloat;
	var dZ: CGFloat;

	init(dX: CGFloat, dY: CGFloat, dZ: CGFloat = 0.0){
		self.dX = dX;
		self.dY = dY;
		self.dZ = dZ;
	}

	func mag() -> CGFloat{
		return sqrt(pow(dX, CGFloat(2)) + pow(dY, CGFloat(2))); 
 	}

	func dist(_ rhsVector: Vector) -> CGFloat{
	
		return sqrt(pow((dX - rhsVector.dX), CGFloat(2)) +  pow((dY - rhsVector.dY), CGFloat(2)));
	}
	func heading() -> CGFloat{
		return atan(dY/dX);
	}

	mutating func add(_ rhsVector: Vector){
		dX += rhsVector.dX;
		dY += rhsVector.dY;
		dZ += rhsVector.dZ;
	}

	mutating func add(x: CGFloat, y: CGFloat){
		dX += x;
		dY += y;
	}

	mutating func add(x: CGFloat, y: CGFloat, z: CGFloat){
		dX += x;
		dY += y;
		dZ += z;
	}

	mutating func sub(_ rhsVector: Vector){
		dX -= rhsVector.dX;
		dY -= rhsVector.dY;
		dZ -= rhsVector.dZ;
	}

	mutating func sub(x: CGFloat, y: CGFloat){
		dX -= x;
		dY -= y;
	}

	mutating func sub(x: CGFloat, y: CGFloat, z: CGFloat){
		dX -= x;
		dY -= y;
		dZ -= z;
	}

	mutating func mult(_ rhsVector: Vector){
		dX *= rhsVector.dX;
		dY *= rhsVector.dY;
		dZ *= rhsVector.dZ;
	}

	mutating func mult(x: CGFloat, y: CGFloat, z: CGFloat){
		dX *= x;
		dY *= y;
		dZ *= z;
	}

	mutating func mult(_ multiplicand: CGFloat){
		dX *= multiplicand;
		dY *= multiplicand;
		dZ *= multiplicand;
	}
//MARK: The division methods needs more work.
	mutating func div(_ rhsVector: Vector){
		guard (rhsVector.dX != 0 && rhsVector.dY != 0 && rhsVector.dZ != 0) else{
			fatalError("Division by Zero is not allowed");
		}
		dX /= rhsVector.dX;
		dY /= rhsVector.dY;
		dZ /= rhsVector.dZ;
	}

	mutating func div(x: CGFloat, y: CGFloat, z: CGFloat){
		guard (x != 0 && y != 0 && z != 0) else{
			fatalError("Division by Zero is not allowed");
		}
		dX /= x;
		dY /= y;
		dZ /= z;
	}

	mutating func div(_ divisor: CGFloat){
		guard divisor != 0 else{
			fatalError("Division by Zero is not allowed");
		}
		dX /= divisor;
		dY /= divisor;
		dZ /= divisor;
	}

	mutating func normalize(){
		let len = self.mag();
		if (len != 0){
			self.mult(1 / len);
		}
	}

	mutating func limit(max: CGFloat){
		let mSq = (dX * dX + dY * dY + dZ * dZ);
		let sqMsq = sqrt(mSq);
		
		if (mSq > (max * max)){
			self.div(sqMsq);
	    		self.mult(max);
		}	
	}
}

enum DivisionError: Error{
	case ByZero
}
//////////////////////////////////////////////////////////////////////////////
// 			Helpers						   //
/////////////////////////////////////////////////////////////////////////////
extension CGFloat{
	func degrees() -> CGFloat{
		return self * 180 / CGFloat.pi;
	}
}

