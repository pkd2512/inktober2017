float inner,outer,x1,y1,x2,y2,angle=0,iter=0;
void setup() 
{
  size(1024, 1024,P2D);
  background(#03001e);
  inner=0;
  outer=width/10;
  x1=0;
  y1=0;
}

void draw()
{
  if(iter<=2000)
  {  
  translate(width/2,height/2);
  x2=outer*(cos(radians(angle)));
  y2=outer*(sin(radians(2*angle)));
  x1=inner*cos(radians(angle));
  y1=inner*sin(radians(angle));
  //line(x1,y1,x2,y2);
  stroke(#ffcc33,30);
  noFill();
  ellipse(x2,y2,outer,outer);
  print(inner+" ");
  
  {
  fill(lerpColor(#360033,#0b8793,map(inner,0,2.5*width,0,1)),map(iter,0,500,3,6));
  //fill(lerpColor(#F4D03F,#0b8793,map(inner,0,2.5*width,0,1)),map(iter,0,1000,3,15));
  //stroke(#acb6e5,map(iter,0,1000,10,30));
  stroke(#ffb347,map(iter,0,1000,10,33));
  ellipse(x1,y1,inner,inner);
  }
  outer+=cos((angle))*sin((angle/2))+sin((angle))*cos((angle/2));
 // outer+=cos(radians(outer))*sin(radians(inner))+ sin(radians(outer))*cos(radians(inner));
  inner++;
 // if(angle<360)
  angle+=PI/2;
  if(iter==2000){save("deep.png");}
  iter++;
}
}