
/*

Navn: Screen
Beskrivelse: Er en abstract class, som er hvad vores GUI bygger på. Alt kommer til at foregå på en screen.

Funktioner:

*/
//Man kan ikke lave statics i inner classes, så vi er nødt til at opbevare vores tidligere skærme herude.
//Vi holder styr på vores "tidligere sider", så vi kan have en back button.
private static ArrayList<Screen> prevScreens = new ArrayList<Screen>();
public ArrayList<Item> items = new ArrayList<Item>();

public abstract class Screen {
  
  //Display ens screen
  public void display(){
    displaying = this;
    items.clear();
    build();
    prevScreens.add(this);
    for (Item item : items) {
      item.display();
    }
    redraw();
  }
  
  
  //addItem tilføjer items ved et specifikt punkt.
  public void add(Item item) {
    items.add(item);
  }
  
  //Formålet med build, er hvor man tilføjer alle sine items til ens screen.
  protected abstract void build();
}

public void mouseClicked(MouseEvent e) {
  for (Item item : items) {
    if (item instanceof Clickable) {
      if (item.inArea(e.getX(), e.getY())){
        ((Clickable)item).click();
      }
    }
  }
}

//Denne funktion er meget performance intensive, da musen bevæger sig hele tiden.
public void mouseMoved(MouseEvent e) {
  for (Item item : items) {
    if (item instanceof Hoverable) {
      if (item.inArea(e.getX(), e.getY())){
        ((Hoverable)item).hover();
      }
    }
  }
}
