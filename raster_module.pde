// Draw the image seed for rasterized modules.
// It's convenient to draw another image source because of rendering proportions.

void generateRasterSeed() {
  rzs.beginDraw();
  seed.resize(rzs.width, 0);
  rzs.image(seed, 0, (rzs.height / 12) * -1);
  rzs.endDraw();
}

void generateRasterImage() {
  generateRasterSeed();
  
  rz.beginDraw();
  int i = 1;

  while (i < 50) {
    rz.background(255);
    rz.noStroke();

    float account = 2 * i;
    float rzw = rz.width / account;
    float rzh = rz.height / account;

    rzs.loadPixels();
    for (int x = 0; x < account; x++) {
      for (int y = 0; y < account; y++) {

        int targetPixelX = int((rzw * x) + (rzw / 2));
        int targetPixelY = int((rzh * y) + (rzh / 2));

        color c = rzs.pixels[index(targetPixelX, targetPixelY, rzs.width)];
        float bc = brightness(c);

        if (bc > 110) {
          rz.fill(0);
        } else {
          rz.fill(255);
        }

        rz.pushMatrix();
        rz.translate(rzw / 2, rzh / 2);
        rz.ellipse(rzw * x, rzh * y, rzw, rzh);
        rz.popMatrix();
      }
    }

    rz.save("export/raster/rz" + i + ".jpg");
    i += 1;
  }
  rz.endDraw();
}
