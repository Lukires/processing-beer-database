

//Jeg gad godt at have det her som en static under Beer, men du ved, det tillader Processing ikke :-)
private Cache<Integer, Beer> beerCache = new Cache<Integer, Beer>();

public Beer getBeer(int id) throws NoBeerException {
  return beerCache.containsKey(id)?beerCache.get(id):new Beer(id);
}

public static Beer[] getBeers() {
  return null;
}

private class Beer {
  
  private int id;
  private String name, brewery, type, supermarket, address;
  private float price, strength;
  
  //Det at beer er private, gør at kun elementer fra samme class kan initialize den.
  //Men du ved, det betyder ikke rigtigt noget i Processing :-)
  private Beer(int id) throws NoBeerException {
    
    this.id=id;
    db.query("SELECT * from beer where beer_ID='"+id+"'");
    
    if(db.next()) {
      name=db.getString("name");
      brewery=db.getString("brewery");
      type=db.getString("type");
      price=db.getFloat("price");
      strength=db.getFloat("strength");
      supermarket=db.getString("supermarket");
      address=db.getString("address");
    }else{
    //Hvis db.next() er tom, så betyder det at der ikke var nogle resultater ved vores ID.
      throw new NoBeerException(id);
    }        
    
    beerCache.put(id, this, 1200000);
    
  }
  
  //Nu er encapsulation ikke rigtigt en ting i Processing, men synes stadig det er nice at have, formelt set.
  public int getID(){return this.id;}
  public String getName(){ return this.name; }
  public String getBrewery(){ return this.brewery; }
  public String getType() { return this.type; }
  public String getSuperMarket() { return this.supermarket; }
  public String getAddress() { return this.address; }
  public float getPrice() { return this.price; }
  public float getStrength() { return this.strength; }
  
}

//Vi har vores NoBeerException som en måde at fortælle vores program, at en øl ikke er i databasen.
public class NoBeerException extends Exception {
  private int id;
  public NoBeerException(int id) {
    this.id=id;
  }
  public String toString() {
    return "NoBeerException @ ID "+id;
  }
}
