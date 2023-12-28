
// Main Image
// ----------
// Display and export the seed image

void generateMainImage() {
  mi.beginDraw();
  mi.colorMode(HSB,360,100,100);
  seed.resize(mi.width, 0);
  mi.image(seed, 0, (mi.height / 10) * -1);
  mi.save("export/main_image/mi.png");
  mi.endDraw();
}
