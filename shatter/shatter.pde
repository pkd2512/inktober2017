import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;
import toxi.processing.*;

ToxiclibsSupport gfx;
Voronoi voronoi;
PImage reference;

void setup()
{
    size( 1359, 1024 );
    
    gfx = new ToxiclibsSupport( this );
    voronoi = new Voronoi();
    
    reference = loadImage("dream.jpg");
    
    for ( int i = 0; i < 200; i++ ) {
        voronoi.addPoint( new Vec2D( random(width), random(height) ) );
    }
        for ( int i = 0; i < 600; i++ ) {
        voronoi.addPoint( new Vec2D( random(width/10,width), random(height/3,height) ));
    }
        for ( int i = 0; i < 1200; i++ ) {
        voronoi.addPoint( new Vec2D( random(width/4,width), random(height/2,height)));
    }
    
    noLoop();
}

void draw()
{
    background( 0 );

    smooth();
    //noStroke();

    
    //color[] colors = new color[voronoi.getRegions().size()];
    //color[] colors = new color[voronoi.getSites().size()];
    for ( Polygon2D polygon : voronoi.getRegions() ) {
        for ( Vec2D v : voronoi.getSites() ) {
          float rad=sqrt(abs(((width-v.x)*(height-v.y)/500)));
          color c = reference.get( int( v.x ), int( v.y ) );;
            if (polygon.containsPoint( v ) ) {
                c = reference.get( int( v.x ), int( v.y ) );
                fill( c );
                strokeWeight(rad/30);
                stroke(lerpColor(#ffffff,c,map(v.x,0,width,0,1)));
                gfx.polygon2D(polygon);
            }
            //else {
            //    fill(lerpColor(#ffffff,c,map(v.x,0,width,0,1)),50*rad);
            //    noStroke();
            //    ellipse(v.x,v.y,rad,rad);

            //}
        }
    }
    
    saveFrame("shatter4.png");
}