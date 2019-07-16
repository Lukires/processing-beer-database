
public class MainScreen extends Screen {
  
  private int page;
  private Screen screen = this;
  
  //Jeg gad godt at lave det her en konstant, men det kan processing ikke lide, så jeg gør det her :-)
  private final int BeersPerPage = 9;
  
  public MainScreen() {
    this(0);
  }
  
  public MainScreen(int page) {
    this.page=page;
  }
  
  public void build() {
    for(int i = 0; i < BeersPerPage; i++){
      try {
        Beer beer = getBeer(i+(BeersPerPage*page));
        
        //Gad ikke at lave et system for et dynamisk interface, så vi må leve med det her
        this.add(new BeerItem(beer, 75+75*(i%3)+300*i%900, 25+25*(i/3)+((int) i/3)*300));
      }catch(NoBeerException e){
        println(e.toString());
      }
    }
    
    //Ikke ligefrem en optimal måde at finde ud af om der er flere sider, men det er nemt og hurtigt at skrive
    try{
      Beer beer = getBeer((1+page*BeersPerPage));
      
      this.add(new Button(1150, 900, 20, 20, (short) 100, (short) 100, (short) 100) {
        @Override
        public void click(){
          new MainScreen((page+1)).display();
        }
      });
      //INSERT NEXT PAGE ITEM
    }catch(NoBeerException e){
      println("Ikke flere sider ",e.toString());
    }
    
    if (page > 0) {
        this.add(new Button(50, 900, 20, 20, (short) 100, (short) 100, (short) 100) {
        @Override
        public void click(){
          new MainScreen((page-1)).display();
        }
      });
    }
  }
}

//Vi genbruger bare MainScreen til vores admin side, men vi tilføjer lidt flere mechanics ;)
public class AdminMainScreen extends MainScreen {
  public void build() {
    super.build();
  }
}
