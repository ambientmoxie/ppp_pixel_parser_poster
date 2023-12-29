void generateGradientLines() {

  int randomFinalColor = round(random(0,inventory.size() - 1));
  color from = color(unhex(colorKeys[0]));
  color to   = color(unhex(colorKeys[1687]));
  color inter;
  float interIndex;
  
  println("end color for gradient lines module is " + randomFinalColor);

  gl.beginDraw();

  for (int i = 0; i < gl.width; i++) {

    interIndex = map(i, 0, gl.width, 0, 1);
    inter = gl.lerpColor(from, to, interIndex);

    gl.stroke(inter);
    gl.line(i, 0, i, height);
  }
  gl.save("export/gradient/gradient-line.jpg");
  gl.endDraw();
}
