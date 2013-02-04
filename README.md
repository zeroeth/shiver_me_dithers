![example output](https://raw.github.com/zeroeth/shiver_me_dithers/master/example_hex.png)

Shiver Me Dithers
=================

Given a source image, use ImageMagick to apply palette remapping in various color spaces with various ordered dithers to create interesting retro art.

Palettes
--------

* [CGA (three 4 color modes)](http://en.wikipedia.org/wiki/Color_Graphics_Adapter)
* [CGA 16 color](http://en.wikipedia.org/wiki/Color_Graphics_Adapter)
* [Tango](http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines#Color_Palette)
* [Solarized](http://ethanschoonover.com/solarized)
* [Websafe double hexes (00,11,22, etc)](http://www.w3schools.com/tags/ref_colorpicker.asp)
* [DawnBringers 16 color](http://www.pixeljoint.com/p/23821.htm)

To use simply plop some images in source_images and run:

    ./shiver_me_dithers.sh
    
If you want to make a palette from an existing image run:

    ./color_juicer.sh <image_file>

Code inspired by ImageMagick documentation on [quantization](http://www.imagemagick.org/Usage/quantize/#quantize) and started from code within.
