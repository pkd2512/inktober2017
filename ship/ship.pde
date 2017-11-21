float w,h,num=30,count;
int swapcount=1;
Plank[] planks; // array of the planks

void setup()
{
  size(1024,1024);
  background(#2C3E50);
  
  w=width/num;
  h=PI*num;

  //Creating an array of the planks
  planks = new Plank[(int)num];  
    float x=0;
    for (int i=0;x<=width;i++)
  { 
    if (i>=num) // expanding the size of array to hold new planks
    {
      planks = (Plank[])expand(planks,(planks.length+1));
    }
    //color c = lerpColor(#fe8c00,#FF512F,map(x,0,width,0,1));
    color c = #fe8c00;
    //color c = lerpColor(#ff0000,#00ff00,map(x,0,width,0,1));
    planks[i] = new Plank(x,0,w,h,c);
    //planks[i].display();
    x+=planks[i].wd; //calculating the new position of the plank
    w=random(width/(num*2*PI),width/num);
    //print(x+" , "+y);
  }
  count=h;
  //frameRate(1);
}

void draw()
{
  if (count<height)
  {
    for (int col=0;col<planks.length;col++)
    {
      //print(planks.length+" , "+col+"\t");
      //print(count+" , ");
      if (col<planks.length-1)
      planks[col+1].posx=planks[col].posx+planks[col].wd;

      planks[col].display();
      planks[col].posy+=planks[col].ht+10;
    }
    
    // Swapping the planks
    
    for (int i=0; i<=swapcount; i++)
    {
      //float temp;
      //int mid=planks.length/2;
      //int from=(int)random(0,mid);
      //int to=(int)random(mid,planks.length);
      //print(to+" , "+from+"\t");
      //temp=planks[from].posx;
      //planks[from].posx=planks[to].posx;
      //planks[to].posx=temp;
      planks[(int)random(0,planks.length)].col=lerpColor(#F16529,#A43931,map(count,0,2*height/3,0,1));
    }
      swapcount+=1+(int)random(num/10,num/8);  
         count=planks[0].posy; // keeping track of the rows
  }
  else
  saveFrame("ship.png");
}

class Plank
{
  float posx,posy;
  float wd;
  float ht;
  color col;
  
  
  Plank(float x, float y, float a, float b, color c)
  {
    posx=x;
    posy=y;
    wd=a;
    ht=b;
    col=c;
  }
  
  void display()
  {
    fill(col);
    stroke(255,100);
    rect(posx,posy,wd,ht);
  }
    
}