PImage jason;
void setup(){
  size(1800, 491);
  jason = loadImage("jasonr_dank.png");
  jason.filter(GRAY);
  image(jason, 0, 0);
  dithering();
  image(jason, 900, 0);
}

int index(int x, int y){
  return x + y * jason.width;
}

void dithering(){
  jason.loadPixels();
  int n = 2;
  for (int y = 0; y < jason.height - 1; y++){
      for (int x = 1; x < jason.width - 1; x++){
      color pix = jason.pixels[index(x,y)];
      
      float oldR = red(pix); 
      float oldG = green(pix);
      float oldB = blue(pix);
      
      int newR = round(n * oldR / 255) * (255 / n);
      int newG = round(n * oldG / 255) * (255 / n);
      int newB = round(n * oldB / 255) * (255 / n);
      
      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;
      
      int index = index(x+1, y);
      color c = jason.pixels[index];
      float r = red(c) + errR * 7/16.0;
      float g = green(c) + errG * 7/16.0;
      float b = blue(c) + errB * 7/16.0;
      jason.pixels[index] = color(r, g, b);
      
      index = index(x-1, y+1);
      c = jason.pixels[index];
      r = red(c) + errR * 5/16.0;
      g = green(c) + errG * 5/16.0;
      b = blue(c) + errB * 5/16.0;
      jason.pixels[index] = color(r, g, b);
      
      index = index(x, y+1);
      c = jason.pixels[index];
      r = red(c) + errR * 3/16.0;
      g = green(c) + errG * 3/16.0;
      b = blue(c) + errB * 3/16.0;
      jason.pixels[index] = color(r, g, b);
      
      index = index(x+1, y+1);
      c = jason.pixels[index];
      r = red(c) + errR * 1/16.0;
      g = green(c) + errG * 1/16.0;
      b = blue(c) + errB * 1/16.0;
      jason.pixels[index] = color(r, g, b);
    }
  }
  jason.updatePixels();
}
