float x1,y1,dim,n=1,weight=PI/n;
void setup()
{
 // size(screen.width,screen.height);
  gradient(0,0,width,height,#000428,#2F0743);
  smooth();
  x1=width/2;
  y1=height/2;
  dim=width;
}

void draw()
{
  if(dim>0)
  {
  curl(x1,y1,dim);
  x1+=(PI/1.618);
  //y1/=2;
  dim-=(PI*1.618);
  }
  //else
  //saveFrame("longtober##.jpeg");
}

void curl(float x, float y, float d)
{
  ellipseMode(CENTER);
  stroke(lerpColor(#7F00FF,#E100FF,map(x,0,width,0,1)));
  noFill();
  smooth();
  if(weight>0.5) {
    weight=PI/n;
  }
  else {
    weight=PI/10;
  }
    
  strokeWeight(weight);
  arc(x,y,d,d, PI*(n-1), PI*n);
  print(x1," ");
  d -= d/2;
  if(n%2!=0)
  {
    x-=d/2;
  }
  else x+=d/2;
  
  n++;
  //y1=dim-y1;
  
  if(d>5)
  curl(x,y,d);
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