
// Variables
// ----

PGraphics sdb; // Seed Base

// Returns resized seed image
// ----

void generateMainImage() {
  sdb.beginDraw();
  seed.resize(sdb.width, 0);
  sdb.image(seed, 0, (sdb.height / 10) * -1);
  //sdb.save("export/main_image/sdb.png");
  sdb.endDraw();
}
