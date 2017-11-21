float zoom = 10;
int maxiterations = 100;
void setup()
{
  fullScreen();
  gradient(0,0,width,height,#41295a,#2F0743);
  smooth();
  //frameRate(1);
  //noLoop();

}

void draw()
{
    display();
    if(zoom>1)
    {
      zoom-=sin(PI/(2*zoom));
    }  
    else noLoop();
}
void mousePressed()
{
  loop();
}
void mouseReleased() 
{
  noLoop();
}


void gradient(int x, int y, float w, float h, color c1, color c2)
{
  for (int i=y; i<=y+h; i++)
  {
    float inter=map(i,y,y+h,0,1);
    stroke (lerpColor(c1,c2,inter));
    line(x,i,x+w,i);
    
  }
}

void display()
{
  float w = zoom;
  float h = (w * height) / width;
  
  float xmin = -w/2;
  float ymin = -h/2;
  
  loadPixels();
  // x goes from xmin to xmax
  float xmax = xmin + w;
  // y goes from ymin to ymax
  float ymax = ymin + h;
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);
  // Start y
    float y = ymin;
    for (int j = 0; j < height; j++) {
      // Start x
      float x = xmin;
      for (int i = 0; i < width; i++) {
    
        // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
        float a = x;
        float b = y;
        int n = 0;
        while (n < maxiterations) {
          //float aa = a * a*a;
          //float bb = b * b*b;
          //float twoab = 2.0 * a * b;
          a = a*a*a -3*a*b*b +x;
          b = 3*a*b*b - b*b*b +y;
          //a = aa - bb + y;
          //b = twoab +x;
          // Infinty in our finite world is simple, let's just consider it 16
          if (dist(a*a, b*b, 0, 0) > 4.0) {
            break;  // Bail
          }
          n++;
        }
    
        // We color each pixel based on how long it takes to get to infinity
        // If we never got there, let's pick the color black
        if (n == maxiterations) {
          //pixels[i+j*width] = color(lerpColor(#41295a,#2F0743,map((j*width),0,height*width,0,1)),100);
        } else {
          float norm = map(n, 0, maxiterations, 0, 1);
          //pixels[i+j*width] = color(map(sqrt(norm), 0, 1, 0, 255));
          pixels[i+j*width] = color(lerpColor(#11998e,#38ef7d,sqrt(norm*zoom)),100);
        }
        x += dx;
      }
      y += dy;
    }  
  updatePixels(); 
}