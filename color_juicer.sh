# Extract all colors from an image to produce a palette
convert $1 -unique-colors -scale 1000%  $1_color_table.gif
