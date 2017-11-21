float r,h,num=33;
Disc[] discs; // array of the planks

void setup()
{
  size(1024,1024);
  background(#24243e);
  r = floor(width/num)-num;
  h = height/(num*1.6);
  discs = new Disc[(int)num];

  float x=0;
  for(int i=0; x<=width-r/3; i++)
  {
     if (i>=num) // expanding the size of array to hold new planks
    {
      discs = (Disc[])expand(discs,(discs.length+1));
    }
    //color c = lerpColor(#40E0D0,#FF0080,map(x,0,width,0,1));
    //color c = lerpColor(#FC466B,#3F5EFB,map(x,0,width,0,1));
    color c = #ffff1c;
    
    discs[i] = new Disc(x,0,r,c);
    x+=discs[i].rad;  
    r = floor(random(width/(num*PI),width/num));    
  }
    color grad[] = new color[discs.length];
   for(int i=0; i<=discs.length/2; i++)
   {
     grad[i] = lerpColor(#40E0D0,#FF8C00,map(discs[i].posx,0,width/2,0,1));
     grad[i+(discs.length/2)] = lerpColor(#FF8C00,#FF0080,map(discs[i+(discs.length/2)].posx,width/2,width,0,1));
   }
   for(int i=0; i<discs.length; i++)
   {
     //println (grad[i]);
     discs[i].col = grad[i];
   }
 
  frameRate(1);
}

void draw() 
{
  sortDisplay(discs, 0, discs.length-1);
  saveFrame("merge.png");
  //noLoop();
}


class Disc
{
  float posx,posy;
  float rad;
  color col;  
  
  Disc(float x, float y, float r, color c)
  {
    posx=x;
    posy=y;
    rad=r;
    col=c;
  }
  
  void display()
  {
    fill(col);
    ellipseMode(CORNER);
    //stroke(255,100);
    noStroke();
    ellipse(posx,posy,rad,rad/1.8);
  } 
}
void merge(Disc arr[], int l, int m, int r)
    {
        // Find sizes of two subarrays to be merged
        int n1 = m - l + 1;
        int n2 = r - m;
 
        /* Create temp arrays */
        float L[] = new float [n1];
        float R[] = new float [n2];
        color LC[] = new color [n1];
        color RC[] = new color [n2];
        /*Copy data to temp arrays*/
        for (int i=0; i<n1; ++i)
        {
            L[i] = discs[l + i].rad;
            LC[i] = discs[l + i].col;
          }
        for (int j=0; j<n2; ++j)
        {
            R[j] = discs[m + 1+ j].rad;
            RC[j] = discs[m + 1 + j].col;
        }
 
        /* Merge the temp arrays */
 
        // Initial indexes of first and second subarrays
        int i = 0, j = 0;
 
        // Initial index of merged subarry array
        int k = l;
        while (i < n1 && j < n2)
        {
            if (L[i] <= R[j])
            {
                discs[k].rad = L[i];
                discs[k].col = LC[i];
                i++;
            }
            else
            {
                discs[k].rad = R[j];
                discs[k].col = RC[j];
                j++;
            }
            k++;
        }
 
        /* Copy remaining elements of L[] if any */
        while (i < n1)
        {
            discs[k].rad = L[i];
            discs[k].col = LC[i];
            i++;
            k++;
        }
 
        /* Copy remaining elements of R[] if any */
        while (j < n2)
        {
            discs[k].rad = R[j];
            discs[k].col = RC[j];
            j++;
            k++;
        }
    }
 
    // Main function that sorts arr[l..r] using
    // merge()
    void sortDisplay(Disc arr[], int l, int r)
    {
        if (l < r)
        {
            // Find the middle point
            int m = (l+r)/2;
 
            // Sort first and second halves
            sortDisplay(arr, l, m);
            sortDisplay(arr , m+1, r);
 
            // Merge the sorted halves
            merge(arr, l, m, r);
            for (int col=0;col<discs.length;col++)
            {
              //print(planks.length+" , "+col+"\t");
              //print(count+" , ");
              if (col<discs.length-1)
              discs[col+1].posx=discs[col].posx+discs[col].rad;
              
              discs[col].display();
              discs[col].posy+=h;
            }
            print("row printed\n");
        }
    }