void generateTwoBlocs(){
  
  int randomFinalColor = round(random(0,inventory.size() - 1));
  
  tb.beginDraw();
  tb.noStroke();
  
  tb.fill(unhex(colorKeys[0]));
  tb.rect(0, 0, tb.width / 2, tb.height);
  tb.fill(unhex(colorKeys[48]));
  tb.rect(tb.width / 2, 0, tb.width / 2, tb.height);
  
  println("end color for two blocs module is " + randomFinalColor);
  tb.save("export/two_blocs/two_blocs.jpg");
  
  tb.endDraw();
  
}
