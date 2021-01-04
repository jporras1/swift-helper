import Foundation

struct Point{
	var x: CGFloat;
	var y: CGFloat;

	init(x: CGFloat, y: CGFloat){
		self.x = x;
		self.y = y;
	}
	
	func dist(_ rhsVector: Point) -> CGFloat{
	
		return sqrt(pow((x - rhsVector.x), CGFloat(2)) +  pow((y - rhsVector.y), CGFloat(2)));
	}
}
