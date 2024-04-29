/// get_random_noise(x, y)
/// Seeded random number generator. Final seed is based on the init seed.

var xx = argument0;
var yy = argument1;

modnum = xx + yy * 65536; // Important! 
// One of the args must be multiplied by a big number (not too big), or noise will be diagonally mirrored. 
// More this number is, less mirroring will be present. Classical 65536 works perfect. :)

var _seed = seed + modnum;

random_set_seed(_seed);

irnum = random_range(0,1); // Can be (0.3 <=> 0.5, 1) for pre-island gen. Will give you less small islands.

return irnum;
