# Texture generator

This project aims at providing procedural generation of
equirectangular textures:
* as a JS library for generation and shader fixes for materials (see the [API](docs/API.md))
* as an online texture generator tool with predefined patterns (see the [generators](https://boytchev.github.io/texture-generator/online/))
* as a collection of codes for configurable equirectangular patterns (see the [catalogue]https://boytchev.github.io/texture-generator/docs/patterns.html))

## A few demos

For the time being, click on a snapshot to run it live, or scroll down for a brief rationale.

[<kbd style="margin:10px">Preliminary demo<br><br><img src="examples/snapshots/proof-of-concept.jpg" style="width:300px;"></kbd>](https://boytchev.github.io/texture-generator/examples/proof-of-concept.html) [<kbd style="margin:10px">Equirectangular bump map<br><br><img src="examples/snapshots/bump-map.jpg" style="width:300px;"></kbd>](https://boytchev.github.io/texture-generator/examples/bump-map.html) [<kbd style="margin:10px">Default pattern<br><br><img src="examples/snapshots/default-pattern.jpg" style="width:300px;"></kbd>](https://boytchev.github.io/texture-generator/examples/default-pattern.html) [<kbd style="margin:10px">AO map<br><br><img src="examples/snapshots/ao-map.jpg" style="width:300px;"></kbd>](https://boytchev.github.io/texture-generator/examples/ao-map.html)

[<kbd style="margin:5px"><img src="examples/snapshots/project-goals.jpg" style="width:100px;"></kbd>](https://boytchev.github.io/texture-generator/examples/project-goals.html)
[<kbd style="margin:5px"><img src="examples/snapshots/square-map.jpg" style="width:100px;"></kbd>](https://boytchev.github.io/texture-generator/examples/square-map.html)
[<kbd style="margin:5px"><img src="examples/snapshots/deferred-generation.jpg" style="width:100px;"></kbd>](https://boytchev.github.io/texture-generator/examples/deferred-generation.html)

## About this library

There are many types of [textures](https://en.wikipedia.org/wiki/Image_texture),
depending on the way they are constructed, how they are used or the objects they
are applied onto. *Procedural textures* are textures that are
[generated by code](https://en.wikipedia.org/wiki/Procedural_texture), instead
of being extracted from photographs, scanned from illustrations or drawn by hand.
*Equirectangular textures* are  textures designed specifically for spheres (the
word *equirectangular* comes from the world of [map projections](https://en.wikipedia.org/wiki/Equirectangular_projection)).

Consider a texture with polka dots and straight lines. The left image shows 
such texture, which is perfect for flat surfaces. An equirectangular version is
shown on the right is features strange deformations of shapes.

<kbd style="margin:10px">Normal texture<br><br><img src="docs/texture-normal.jpg" style="width:300px;"></kbd> <kbd style="margin:10px">Equirectangular texture<br><br><img src="docs/texture-equirectangular.jpg" style="width:300px;"></kbd>

When mapped to a sphere, the normal alignment of texture shapes gets distorted
near the poles, while the equirectangular texture creates good proportions of
shapes and straight lines. The deformation of shapes has been undeformed by the
curvature of the sphere surface. This is what this library does &ndash; it generates
equirectangular textures.

<kbd style="margin:10px">Normal texture on sphere<br><br><img src="docs/texture-normal-sphere.jpg" style="width:300px;"> </kbd> <kbd style="margin:10px">Equirectangular texture on sphere<br><br><img src="docs/texture-equirectangular-sphere.jpg" style="width:300px;"></kbd>

## But wait, there is more

When textures are applied to [low-poly spheres](https://en.wikipedia.org/wiki/Low_poly)
there is a noticeable zig-zag distortion of the texture shapes, especially near
the poles. This happens for normal and equirectangular textures alike. This phenomena
is not caused by the texture itself, but by the algorithm that maps the texture
on a sphere. This library provides a fix for this by modifying the [shader code](https://en.wikipedia.org/wiki/Shader).
Even after the fix, one could see sharp corners in the lines. These are just
optical illusions, caused by the hard edges of a low-poly geometry.

<kbd style="margin:10px">Low-poly texture distortion<br><br><img src="docs/texture-low-poly-distortion.jpg" style="width:300px;"> </kbd> <kbd style="margin:10px">Low-poly shader fix<br><br><img src="docs/texture-low-poly-fixed.jpg" style="width:300px;"></kbd>

As the number of faces decreases, the deformation of textures becomes
disturbing. The following image shows the normal, the equirectangular and the
fixed equirectangular textures on a [dodecahedron](https://en.wikipedia.org/wiki/Platonic_solid).

<kbd style="margin:10px">Extreme low-poly distortion fixed by shader<br><br><img src="docs/texture-low-poly-distortion-2.jpg" style="width:460px;">

## What's the catch

Fixing the shader code of Three.js materials adds additional instructions as a patch. 
A better solution would be if [THREE.EquirectangularReflectionMapping](https://threejs.org/docs/#api/en/constants/Textures)
is supported for all maps, not just the environment map.

Unfortunately, there is a bigger issue. Equirectangular maps are not compatible
with [mipmaps](https://en.wikipedia.org/wiki/Mipmap). If any of the mipmap filter
is used for [THREE.Texture.minFilter](https://threejs.org/docs/#api/en/textures/Texture.minFilter),
the result will have a thin pixel-wide seam along the edge of the texture.
Currently the library avoids the seam by turning off mipmaps. As a side effect,
this removes texture smoothing and makes texture noise more prominent.

A possible solution might be to limit the mipmaps to only the first few levels,
or to mask the seam with sufficiently picturesque texture. If anyone knows a
performant way to resolve this issue, it will make the library more useful to
the general community.
