
// Variables
// ----

PGraphics rvbs;
PGraphics rvb;
color newValue;
color colorCheck;

void generateRVBSeed() {
  rvbs.beginDraw();
  seed.resize(rvb.width, 0);
  rvbs.image(seed, 0, (rvbs.height / 12) * -1);
  rvbs.endDraw();
}

void generateRVBImage() {
  generateRVBSeed();

  rvb.beginDraw();
  rvbs.loadPixels();
  rvb.loadPixels();

  int p = 0;

  while (p < 3) {
    for (int i = 0; i < rvbs.pixels.length; i++) {

      switch(p) {
      case 0:
        newValue = color(255, 0, 0);
        colorCheck = int(red(rvbs.pixels[i]));
        break;
      case 1:
        newValue = color(0, 255, 0);
        colorCheck = int(green(rvbs.pixels[i]));
        break;
      case 2:
        newValue = color(0, 0, 255);
        colorCheck = int(blue(rvbs.pixels[i]));
        break;
      }

      if (colorCheck > 30) {
        rvb.pixels[i] = newValue;
      } else {
        rvb.pixels[i] = color(255);
      }
    }
    rvb.updatePixels();
    rvb.save("export/rvb/rvb" + p + ".jpg");
    p++;
  }

  rvb.endDraw();
}
