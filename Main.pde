import de.bezier.data.sql.*;
SQLite db;

public Screen displaying = new MainScreen();

void draw() {
  background(200);
  displaying.display();
}

void setup() {
    size(1200, 1000);
    noLoop();
    
    //Ændre det her til hvor din database er!
    db = new SQLite(this, "/home/lukas/sketchbook/2project/Main/beer.sqlite");

    if (db.connect()) {
        // list table names
        db.query("SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"" );
        
        while (db.next()) {
            println(db.getString("Name"));
        }
    }
}
