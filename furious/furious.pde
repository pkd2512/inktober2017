float id_r, ego_r, iter=PI*100;
PShader nebula, nebula_stars;
void setup() 
{
  size(1024, 1024,P2D);
  id_r=width/5;
  //nebula = loadShader("nebula.glsl");
  //nebula.set("resolution", float(width), float(height));
  nebula_stars = loadShader("nebula_stars.glsl");
  nebula_stars.set("resolution", float(width), float(height));
  ego_r=width/10;
  //frameRate(10);

}

void draw()
{
  background(#03001e);
  translate(width/2,height/2);
  
  //{ 
  //  noFill();
  //  stroke(255);
    float radius=id_r;

    nebula_stars.set("time", millis()/(PI*50.0) );  
    shader(nebula_stars);    
    for(int i=0; i<iter; i++)
    {
      float angle1 = radians(random(0,360));
      float angle2 = radians(360-random(0,360));
      
      float x1 = radius*cos(angle1);
      float y1 = radius*sin(angle1);
      float x2 = radius*cos(angle2);
      float y2 = radius*sin(angle2);
      strokeWeight(1);
      line(x1,y1,x2,y2);
      print(radius);
    }
  
  petals();
  //saveFrame("png/f-####.png");
}

float angle=0;
void petals()
{
  if (angle<=360)
  {
  nebula_stars.set("time", millis()/(PI*500.0) );  
  shader(nebula_stars); 
  float r1=2*width/PI, r2=width/PI;
  //print(ego_r);
  stroke(255);
  strokeWeight(2);
  noFill();
  ellipseMode(CORNER);
  rotate(radians(angle));
  ellipse(ego_r,ego_r,r2,r1);
  angle+=2.8125;
  petals();
  }
  if (angle>360) 
  angle=0;
}