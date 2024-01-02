
// Variables
// ----

PGraphics rvbs;
PGraphics rds; // red shader
PGraphics gns; // green shader
PGraphics bes; // green shader
color newValue;
color colorCheck;

void generateRVBseed() {
  rvbs.beginDraw();
  seed.resize(rvbs.width, 0);
  rvbs.image(seed, 0, (rvbs.height / 12) * -1);
  rvbs.endDraw();
}

void generateRVBImages() {
  generateRVBseed();
  rvbs.loadPixels();

  rds.beginDraw();
  gns.beginDraw();
  bes.beginDraw();
  rds.loadPixels();
  gns.loadPixels();
  bes.loadPixels();

  for (int i = 0; i < rvbs.pixels.length; i++) {
    createPattern(rds, i, color(255, 0, 0), int(red(rvbs.pixels[i])));
    createPattern(gns, i, color(0, 255, 0), int(green(rvbs.pixels[i])));
    createPattern(bes, i, color(0, 0, 255), int(blue(rvbs.pixels[i])));
  }

  rds.updatePixels();
  gns.updatePixels();
  bes.updatePixels();
  rds.endDraw();
  gns.endDraw();
  bes.endDraw();

  // Save your shaders here if needed
}

void createPattern(PGraphics buffer, int i, color newValue, int colorIntensity) {
  buffer.pixels[i] = colorIntensity > 30 ? newValue : color(255);
}
