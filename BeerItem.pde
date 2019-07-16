

public class BeerItem extends Box implements Clickable, Hoverable {
  
  private Beer beer;
  public BeerItem(Beer beer, int x, int y) {
    super(x, y, 300, 300, (short) 250, (short) 245, (short) 245);
    this.beer=beer;
    
  }
  
  @Override
  public void display(){
    super.display();
    write();
  }
  
  private void write(){
    fill(0);
    textSize(16); 
    text("Navn: "+beer.getName(), x+10, y+36);
    text("Bryggeri: "+beer.getBrewery(), x+10, y+52);
    text("Type: "+beer.getType(), x+10, y+68);
    text("Pris: "+beer.getPrice(), x+10, y+100);
    text("Styrke: "+beer.getStrength(), x+10, y+116);
    text("Supermarket: "+beer.getSuperMarket(), x+10, y+140);
    text("Address: "+beer.getAddress(), x+10, y+170, 300, 200); 
  }
  
  public void hover() {
    println("Hover",this.toString());
  }
  
  
  public void click(){
    println("Thank you Kanye, very cool",this.toString());
  }
}
