float angle=0, ego_r;
void setup() 
{
  size(1024, 1024);
  background(#2F0743);
  translate(width/2,height/2);
  ego_r=width/40;
  
  blinds();
  eye();
  petals();
  eyeball();
  
  noLoop();
}
void draw()
{
  save("blinds.png");
}
void petals()
{
  if (angle<360)
  {
  float r1=height/12, r2=width/12;
  //print(ego_r);
  stroke(#7F00FF,128);
  strokeWeight(1);
  noFill();
  ellipseMode(CORNER);
  rotate(radians(angle));
  ellipse(ego_r/4,2*ego_r,r2,r1);
  angle+=2.8125*2;
  petals();
  }
  //if (angle>360) 
  //angle=0;
}

void eyeball()
{
  float radius=5.2*ego_r;
  int i=0;
  ellipseMode(CENTER);
  fill(#38ef7d,128);
  noStroke();
  ellipse(0,0,radius,radius);
  //ellipseMode(CORNER);
  //ellipse(0,radius/4,radius/2,radius/2);
  translate(0,radius/2);
  for(i=4;i>=1;i--)
  {
    fill(lerpColor(#38ef7d,#11998e,map(i,0,4,0,1)),128);
    //print(radius);
    //arc(0,0,radius,radius/i,PI,2*PI);
    ellipse(0,-radius/8*i,i*radius/4,i*radius/4);
  }
}

void eye()
{
  
  //fill(#53346D,255);
  noStroke();
  float radius=width/2;
  ellipseMode(RADIUS);
  fill(#2F0743,255);
  arc(0,0,2*radius/2,radius/2.5,PI,2*PI);
  arc(0,0,2*radius/2,radius/2.5,0,PI);
  fill(#03001e,255);

  arc(0,0,radius/8,radius/3,PI,2*PI);

}
void blinds()
{
  //fill(#03001e,255);
  noStroke();
  fill(#c94b4b,128);
  //int weight=2;
  //stroke(#c94b4b);
  //strokeWeight(weight);
  //rect(-width/2,0,width,height/2);
  float tall=height/20;
  // For the bottom
  for (float i=-20;tall>1;i+=20)
  {
    print(tall);
    fill(#c94b4b,map(tall,height/20,1,10,255));
      rect(-width/2,i,width,tall);
      tall-=tall/10;

  }
  
  //For the top
  tall=height/20;
  for (float i=-20;tall>1;i+=20)
  {
    print(tall);
    fill(#c94b4b,map(tall,height/20,1,10,255));
      rect(-width/2,-i,width,-tall);
      tall-=tall/10;

  }

}