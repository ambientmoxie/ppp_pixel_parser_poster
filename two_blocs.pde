
// Variables
// ----

PGraphics cbb;

void generateTwoBlocs(){
  
  cbb.beginDraw();
  cbb.noStroke();
  
  cbb.fill(unhex(colorKeys[0]));
  cbb.rect(0, 0, cbb.width / 2, cbb.height);
  cbb.fill(unhex(colorKeys[1687])); // Use recorded index
  cbb.rect(cbb.width / 2, 0, cbb.width / 2, cbb.height);
  
  cbb.save("export/two_blocs/two_blocs.jpg");
  
  cbb.endDraw();
  
}
