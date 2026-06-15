ffmpeg -framerate 3 -i ../output/single_batch/frame_%04d.png -pix_fmt yuv420p growth.mp4
ffmpeg -i growth.mp4 -vf "fps=10,scale=320:-1:flags=lanczos" growth.gif