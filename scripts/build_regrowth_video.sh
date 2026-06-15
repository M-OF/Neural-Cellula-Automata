ffmpeg -framerate 10 -i ../output/regrowth_test/frame_%04d.png -pix_fmt yuv420p regrowth.mp4
ffmpeg -i regrowth.mp4 -vf "fps=10,scale=320:-1:flags=lanczos" regrowth.gif