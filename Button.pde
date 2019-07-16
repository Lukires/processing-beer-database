
public class Button extends Box implements Clickable {
  
  public Button(int x, int y, int height, int width, short r, short g, short b) {
    super(x,y,height,width,r,g,b);
  }
  
  
  //Denne funktion er ment til at blive overrided.
  public void click() {
    println("Clicked ",this.toString());
  }
  
}
