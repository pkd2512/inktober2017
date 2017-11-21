float x1,y1,dim,n=1;
void setup()
{
  size(1024,1024);
  gradient(0,0,width,height,#ACB6E5,#74ebd5);
  smooth();
  x1=width/2;
  y1=height/2.5;
  dim=width;
  smile(x1,y1,dim);
  //lower(x1,y1,dim);
  n=1;
  upper(x1,y1,dim);
  save("giga.jpeg");
}


void upper(float x, float y, float d)
{
  ellipseMode(CENTER);
  stroke(#B3FFAB);
  //noFill();
  strokeWeight(map(n,1,250,0.5,2));
  //noStroke();
  fill(lerpColor(#11998e,#38ef7d,map(n,0,width/2,0,1)),120);
  if (n>1) arc(x,y,d,d, PI*(n-1), PI*(n));
  print(n," ");
  d = d/2;
  float xa=x,xb=x;
  if (d>5)
  {
    xa-=d/2;
    xb+=d/2;
    upper(xa,y,d);
    upper(xb,y,d);
  }  
  n+=1;
}
void lower(float x, float y, float d)
{
  ellipseMode(CENTER);
  //stroke(255);
  //noFill();
  //strokeWeight(2);
  //noStroke();
  fill(lerpColor(#E5008D,#FF070B,map(n,width/2,0,0,1)),69);
  arc(x,y,d,d, PI*(n-1), PI*(n));
  print(x1," ");
  d = d/2;
  float xa=x,xb=x;
  if (d>5)
  {
    xa-=d/2;
    xb+=d/2;
    lower(xa,y,d);
    //lower(xb,y,d);
  }  
  n+=2;
}

void smile(float x, float y, float d)
{
  ellipseMode(CENTER);
  stroke(#B3FFAB,100);
  //noFill();
  strokeWeight(PI/10);
  fill(lerpColor(#3C3B3F,#605C3C,map(x,0,width,0,1)));
  arc(x,y,d,d, 0, PI);
  if (d>5)
  {
    d-=10;
    smile(x,y,d);
  }
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