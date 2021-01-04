import Foundation



var v1 = Vector(dX: 10.0, dY: 20.0, dZ: 2.0);
var v2 = Vector(dX: 4.0, dY: 7.0);


print(v1.dX, v1.dY, v1.dZ);
print(v2.dX, v2.dY, v2.dZ);

//v1.mult(x: 4, y: 7, z:1);
//v1.mult(x: 2.0, y: 4.0, z: 1.0);
//v1.div(v2);

v1.limit(max: 5);

print(v1.dX, v1.dY, v1.dZ);
print(v2.dX, v2.dY, v2.dZ);





