# godot-glitch-fade

Download as a zip and import

- uniform boolean horizontal; (true means horizontal, false means vertical)
- uniform float distort; (between -1 and 1)
- uniform sampler2d noise; (noise texture, you can just use opensimplex noise that godot provides)

for horizontal fading I want the pixels in the same y level to share the same noise value

![image](https://user-images.githubusercontent.com/89374056/182784682-b7daa3f3-d90e-441a-a113-9e43d65cda31.png)

now use the flattened uv to get the noise value

![image](https://user-images.githubusercontent.com/89374056/182784951-5150f98e-650c-4137-b40c-e0f08b55eaea.png)

here you could just distort the image by the noise value linearly, but I find that boring, so instead of a simple distort*noise_val type thing, run the noise value thru this

![image](https://user-images.githubusercontent.com/89374056/182785327-e250c5b0-6951-430b-a8e5-25dff94e0d22.png)

now with distort at 0, it doesn't distort the texture, at 1 it fades the texture away completely, but negative distort currently just does exactly what positive does, we can get the directionality back, by multiplying out result with the sign

![image](https://user-images.githubusercontent.com/89374056/182786047-ffb0ab01-8f9d-4b87-9b5c-3d27e0805a65.png)

this, then, is how much to distort, *and* the direction to distort, put this result in either x or y depending on horizontal or vertical

![image](https://user-images.githubusercontent.com/89374056/182786368-3e9dbada-e0a6-4084-a57a-c9325c2ca1ee.png)

add it onto the uv

![image](https://user-images.githubusercontent.com/89374056/182786480-ffad3ec6-e28f-4f68-8f07-a54681d6af50.png)

use the uv to grab the original texture, aaaaand we're done!

![image](https://user-images.githubusercontent.com/89374056/182786713-7d7c4e85-6b66-436c-b64b-ab881b7e9ca0.png)

except, this

![image](https://user-images.githubusercontent.com/89374056/182786947-6cd176b9-a262-47c1-b83d-8ac6d8a28ba1.png)

uv coordinate over 1 or under 0 may result in it, or maybe other result for you, but let's just make it cleaner either

using `step()` to get 1 if the uv is in legal range(0 to 1) and 0 is its outside(over 1 or under 0), here im using `smoothstep()`, if you dont have screen_pixel_uv then try `1./resolution.x` or something similar, `step(val, edge)` instead of the normal `step(edge, val)` gives you essentially `1.-step(edge, vel)`, i assume we all know this

![image](https://user-images.githubusercontent.com/89374056/182787301-385ce462-7963-48c3-b466-7ba779531746.png)
