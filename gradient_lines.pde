
// Variables
// ----

PGraphics gtb;

// Return gradient
// ----
// From average brightness value in the image to white

void generateGradientLines() {

  int randomFinalColor = round(random(0,inventory.size() - 1));
  color from = color(unhex(colorKeys[0]));
  color to   = color(unhex(colorKeys[1687]));
  color inter;
  float interIndex;
  
  println("Recorded color index " + randomFinalColor);

  gtb.beginDraw();

  for (int i = 0; i < gtb.width; i++) {

    interIndex = map(i, 0, gtb.width, 0, 1);
    inter = gtb.lerpColor(from, to, interIndex);

    gtb.stroke(inter);
    gtb.line(i, 0, i, height);
  }
  gtb.save("export/gradient/gradient-line.jpg");
  gtb.endDraw();
}
