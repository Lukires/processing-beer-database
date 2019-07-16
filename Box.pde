
public class Box extends Item {
  
  //R, g & b er shorts fordi det kræver mindre memory end ints :-)
  //Shorts er kun 16 bits, i stedet for 32 som ints.
  protected short r, g ,b;
  public Box(int x, int y, int height, int width, short r, short g, short b) {
    super(x,y,height,width);
    this.r=r;
    this.g=g;
    this.b=b;
    
  }
  
  public void display() {
    fill(r,g,b);
    rect(super.x, super.y, super.height, super.width);
  }
  
}
