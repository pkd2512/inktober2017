class Divider 
{
 float x;
 float y;
 float xsize;
 float ysize;
 float angle;
 
 Divider()
 {
  x=width/2;
  y=height/2;
  xsize=2;
  ysize=height/2;
  angle=0;
 }
 
 void generate()
 {
   if (x>width) {x=0;}
   if (x<0) {x=width;}
   if (y>height) {y=0;}
   if (y<0) {y=height;}
   
   if (x<=width)
   {
     while (y<=height)
     {
       noStroke();
       fill(lerpColor(#36D1DC, #5B86E5, 0.33),169);
       translate(x,y);
       rotate(angle);
      
         ellipse(x,x,xsize,ysize);
         ellipse(y,y,xsize,ysize);
         float radius=ysize*random(0.1);

         ellipse(x,y,radius,radius);
         
         noFill();
         stroke(lerpColor(#f79d00, #64f38c, 0.5));
         ellipse(x-radius,y,radius,radius);
         ellipse(x,y-radius,radius,radius);

         y+=(height-ysize)*(random(0.01));

     }
   }
 }      
}

void setup()
{
  size(800,800);
  background(lerpColor(#141E30, #243B55, 0.5));
  frameRate(1);
  noLoop();
}

void draw()
{
  Divider div = new Divider();
  div.x=random(0,width);
  div.y=random(0,height);
  div.xsize=random(1,5);
  div.ysize=random(10,height/PI);
  //float[] rots = {0, PI/2, PI/4, PI/2, PI/2, 2*PI};
  //div.angle=rots[(int)(random(rots.length))];
  div.angle=(random(-2*PI, 2*PI));
  print(div.angle+"\t");
  div.generate();
  saveFrame("swift-####.jpeg");
}

void mousePressed()
{
  loop();
}
void mouseReleased() 
{
  noLoop();
}