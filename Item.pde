public abstract class Item {
  
  protected int height, width, x, y;
  
  public Item(int x, int y, int height, int width) {
  this.height=height;
  this.width=width;
  this.x=x;
  this.y=y;
  }
  
 public abstract void display();
 
 public boolean inArea(int x, int y) {
   return (x >= this.x && y >= this.y && x <= this.x+width && y <= this.y+height);
 }
}


public interface Clickable { 
  public void click();
}

//Jeg gad godt at have det her som en static funktion under vores Hoverable, men det kan vi ikke da Processing bruger Java 6 :-)
public static ArrayList<Item> hovers = new ArrayList<Item>();

public interface Hoverable {
  public void hover();
}
