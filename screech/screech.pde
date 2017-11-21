float xx,yy,size,newsize,theta,flag=0;
void setup()
{
  size(1024,1024);
  background(#1F1C2C);
  xx=1;
  yy=height;
  size=300;
  theta=0;
  newsize=size;
}

void draw()
{
  if (xx>width || xx<0 || yy>height || yy<0)
  {
    noLoop();
    save("screech.png");
  }

  if (newsize>size/2 && flag==0)
  {
    tracks(xx,yy,newsize,theta);
    xx+=2;
    yy-=2;
    theta+=PI/100;
    newsize-=1;
    if (newsize==size/2) 
    {
      flag=1;
      newsize=size/2;
    }
    print(newsize+"\t");
  }
  
  else if (newsize<size && flag==1) 
  {
    tracks(xx,yy,newsize,theta);
    xx+=2;
    yy-=2;
    newsize+=1;
      theta+=PI/100;
    if (newsize==size) 
    {
      flag=0;
      newsize=size;
    }
    print(newsize+"\t"+theta);
  }
}


void tracks(float x, float y, float len, float angle)
{  
  noFill();
  strokeWeight(1.618);
  translate(x,y);
  rotate(angle);
  float gutter=len/2;
  stroke(lerpColor(#fafafa,#fffc00, map(len,0,size,0,1)));
  line(0,0, len,0);
  stroke(lerpColor(#fffc00, #fafafa,map(len,0,size,0,1)));
  line(len+gutter,0, len+gutter+len,0);  
}