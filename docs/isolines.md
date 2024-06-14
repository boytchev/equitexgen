<img class="logo" src="../assets/logo/logo-big.png">


# Procedural Equirectangular Textures


## Isolines
<img src="images/isolines.jpg">

This texture renders looped concentric lines like
[contour lines](https://en.wikipedia.org/wiki/Contour_line)
found in topographic and meteorological maps. The generated
texture is intended for color maps. Click on a snapshot to
open it online.

<p class="gallery">

	<a class="style-block nocaption" href="../online/isolines.html?width=1024&height=512&scale=60&blur=10&density=20&balance=50&color=16777215&background=0">
		<img src="images/isolines-1.png">
	</a>

	<a class="style-block nocaption" href="../online/isolines.html?width=1024&height=512&scale=80&blur=45&density=14&balance=16&color=16777215&background=3148976">
		<img src="images/isolines-2.png">
	</a>

	<a class="style-block nocaption" href="../online/isolines.html?width=1024&height=512&scale=100&blur=3&density=6&balance=28&color=13041664&background=16777215">
		<img src="images/isolines-3.png">
	</a>

</p>


### Code example

Code template of parameters with their default values.

```js
import * as PET from "pet/patterns/isolines.js";
:
model.material.map = PET.texture( );
PET.material( model.material );
```


### Parameters

The parameters of the texture generator are:

* `width` &ndash; texture width in pixels, default 1024
* `height` &ndash; texture height in pixels, default 512
* `scale` &ndash; pattern size [0,100], default 50
* `density` &ndash; density of lines [0,100], default 20
* `blur` &ndash; smoothness of lines edges [0,100], default 10
* `balance` &ndash; thickness of lines [0,100], default 50
* `color` &ndash; color of lines, default 0xFFFFFF (white)
* `background &ndash; color of background, default 0x000000 (black)


### API

All texture modules share the same API.

* `pattern( x, y, z, color, options )` &ndash; pattern implementation
* `texture( {params} )` &ndash; generator for a texture with given parameters
* `defaults` &ndash; object with default parameters
* `material( ... )` &ndash; material shader patcher


### Online generator

[online/isolines.html](../online/isolines.html)


### Source

[src/patterns/isolines.js](https://github.com/boytchev/texture-generator/blob/main/src/patterns/isolines.js)


		
<div class="footnote">
	<a href="#" onclick="window.history.back(); return false;">Back</a>
</div>