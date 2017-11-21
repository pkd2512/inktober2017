import wblut.core.*;
import wblut.geom.*;
import wblut.hemesh.*;
import wblut.math.*;
import wblut.nurbs.*;
import wblut.processing.*;
 
WB_Render3D render;
HE_Mesh mesh;
float radius=PI*50;
void create(){
 HEC_Geodesic creator=new HEC_Geodesic().setRadius(radius);
 mesh=new HE_Mesh(creator);
}
void setup() {
  size(800, 600, P3D);  
  smooth(8);
  background(255);
  render=new WB_Render3D(this);
  create();
  frameRate(1);
  noLoop();
}
void mesh()
{
  for (int i = 0; i < 5000; i++) 
  {
    float x0 = random(width);
    float y0 = random(height);
    float z0 = random(-50,50);
    float x1 = random(width);
    float y1 = random(height);
    float z1 = random(-50,50);
    
    // purely 2D lines will trigger the GLU 
    // tessellator to add accurate line caps,
    // but performance will be substantially
    // lower.
    stroke(0, 10);
    line(x0, y0,z0, x1, y1,z1);
    fill(300);
    //ellipse(x0,y0,10,10);
  }
}
void draw()
{
  
  //directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(255, 255, 255, 0, 0, -1);
  //for(float x=radius; x<width; x+=300)
  //{
  //  for (float y=radius; y<height; y+=100)
  //  {
  //    dome(x,y,0);
  //  }
  //}
  dome(200,200,0);
  //if (frameCount % 10 == 0) println(frameRate);
}
void dome(float x, float y, float z)
{
  //directionalLight(255, 255, 255, 0, 0, 500);
  ////directionalLight(127, 127, 127, -1, -1, 1);
  translate(x,y,z);
  {
  noStroke();
  fill(255);

  render.drawFaces(mesh);
  }
  strokeWeight(2);
  render.drawFaceNormals(mesh,PI);
}