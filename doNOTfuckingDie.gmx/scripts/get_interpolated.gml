/// get_interpolated(x, y)
/// 2d interpolation. 
/// Cosine algorithm is used.


var xx = argument0;
var yy = argument1;

var XIndex = floor(xx);
var remX = xx - XIndex; // Remainder from x for calculatin interpolation.

var YIndex = floor(yy);
var remY = yy - YIndex; // Remainder from y for calculatin interpolation.

// Get closest points, for interpolation.
var a = get_random_noise(XIndex, YIndex);
var b = get_random_noise(XIndex + 1, YIndex);        
var c = get_random_noise(XIndex, YIndex + 1);
var d = get_random_noise(XIndex + 1, YIndex + 1);  

// Cosine interpolation.
var ftx = remX * pi;
var fx = (1 - cos(ftx)) / 2;    

var i1 = a * (1 - fx) + b * fx;
var i2 = c * (1 - fx) + d * fx;

var fty = remY * pi;
var fy = (1 - cos(fty)) / 2;

var interpolated = i1 * (1 - fy) + i2 * fy;

return interpolated;
