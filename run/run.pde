float radius,size,x,y,iter=1,angle;
void setup()
{
  size(1042,1042);
  background(#093637);
  size=2*PI;
  radius=width/2-size*2;
  angle=0;
}

void draw()
{
  if (radius>30)
  {
  runner(radius,angle,size);
      
  angle+=2;
  radius-=iter*PI/11;
  
  if (angle%360==0)
  {
      iter++;
      size-=PI/5;     
  }
  print(radius+", "+iter);
  }
  else
  {
  save("runner##.jpeg");
  noLoop();
  }
}

void runner(float r, float angle, float size)
{
  noStroke();
  translate(width/2,height/2);
  fill(#c94b4b,200);
  fill(lerpColor(#c94b4b,#cc5333,map(iter,0,3,0,1)));
  x=r*cos(radians(angle)) ;
  y=r*sin(radians(angle)) ;
  rect(x,y,size,size);  
  for (float i=1;i<iter;i++)
  {
    float x1=(r-PI*5*i)*cos(radians(angle)) ;
    float y1=(r-PI*5*i)*sin(radians(angle)) ;
    float x2=(r+PI*5*i)*cos(radians(angle)) ;
    float y2=(r+PI*5*i)*sin(radians(angle)) ;  
    fill(lerpColor(#F7971E,#FFD200,map(iter,0,3,0,1)));
     ellipse(x1,y1,PI,PI);
     ellipse(x2,y2,PI,PI);
  }
}