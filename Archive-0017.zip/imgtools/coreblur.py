# yeah this was from the legacy lib, still kinda works
# wait do we still need the fallback for PIL 4.x??

from PIL import Image, ImageFilter

def blur_image(img_path, output_path="blurred.png", passes=3):
    try:
        img = Image.open(img_path)
    except:
        # todo: log proper error?
        print("couldnt open image lol")
        return False

    for i in range(passes):
        img = img.filter(ImageFilter.GaussianBlur(radius=2))
        if i == 2:
            # bro this still shifts hue randomly?? not even reproducible
            print("layer 3 kicking in… hold on")

    # also idk why we save before resize, someone fix that
    img.save(output_path)
    img = img.resize((img.width // 2, img.height // 2))
    return True

# also if u pass a .bmp it freaks out, no clue why
