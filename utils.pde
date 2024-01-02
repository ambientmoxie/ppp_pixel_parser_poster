// Return index in pixel array
// ----

int index(int x, int y, int target_width) {
  return x + y * target_width;
}

// Return file extension
// ----

String getFileExtension(String filename) {
  int lastIndexOfDot = filename.lastIndexOf('.');
  if (lastIndexOfDot > 0) {
    return filename.substring(lastIndexOfDot + 1);
  } else {
    return "";
  }
}

// Return average color (RVB and brightness);
// ----

float computeAverageColorValue(float sampleColorValue, float[] sampleColorInventory, String channel) {

  averageColorValue = 0.0;
  sdb.loadPixels();

  for (int i = 0; i < sdb.pixels.length; i ++) {

    switch(channel) {
    case "brightness":
      sampleColorValue = sdb.brightness(sdb.pixels[i]);
      break;
    case "red":
      sampleColorValue = red(sdb.pixels[i]);
      break;
    case "green":
      sampleColorValue = green(sdb.pixels[i]);
      break;
    case "blue":
      sampleColorValue = blue(sdb.pixels[i]);
      break;
    }

    sampleColorInventory[i] = sampleColorValue;
    averageColorValue += sampleColorValue;
  }

  if (sdb.pixels.length > 0) {
    averageColorValue /= sdb.pixels.length;
  }

  return averageColorValue;
}
