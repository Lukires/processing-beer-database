import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;

//Caching system
/*

Formålet er at gøre så vi ikke henter ting fra databasen, som vi allerede har hentet før.
Ting bliver holdt i vores cache i x antal tid.

*/

public class Cache<K, T> extends HashMap<K, T> {
      public void put(final K key, T item, long expires) {
        super.put(key, item);
        Timer timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                remove(key);
            }
        }, expires);
    }
}
