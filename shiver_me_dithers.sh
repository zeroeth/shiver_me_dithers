### EACH IMAGE TO MODIFY #################
for source_image_full_path in source_images/*
do
  source_image_file_name="${source_image_full_path##*/}"
  source_image_name="${source_image_file_name%%.*}"

  ### EACH PALETTE #######################
  for palette_full_path in palettes/*
  do
    palette_file_name="${palette_full_path##*/}"
    palette_name="${palette_file_name%%.*}"

    ### EACH COLOR SPACE #################
    # RGB CMY sRGB GRAY  YIQ YUV OHTA XYZ  HSL HSB HWB
    for color_space in RGB CMY sRGB GRAY  YIQ YUV OHTA XYZ  HSL HSB HWB
    do

      ### EACH DITHER PATTERN ############
      # threshold checks o2x2 o4x4 o8x8
      for dither_pattern in threshold checks o2x2 o4x4 o8x8 none
      do
        if [[ $dither_pattern = "none" ]]
        then
          dither_argument="+dither"
        else
          dither_argument="-ordered-dither $dither_pattern"
        fi

        printf "%-15s: %-10s -> %-5s (%-6s)\n" "$source_image_name" "$palette_name" "$color_space" "$dither_pattern"

        mkdir -p "output/"
        destination_file="output/${source_image_name}_${color_space}_${palette_name}_${dither_pattern}.gif"

        if [[ -e $destination_file ]]
        then
          echo "skipping $destination_file"
        else
          #  +dither OR -dither FloydSteinberg
          #  -colors 16 OR -remap solarized_color_table.gif
          #  -fill black  -gravity SouthWest  -annotate +2+2 $color_space \
          # switching order affects output
          convert $source_image_full_path \
            $dither_argument \
            -quantize $color_space \
            -remap $palette_full_path \
            $destination_file
        fi
      done
    done
  done
done
