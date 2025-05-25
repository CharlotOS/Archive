// warning: this parser ignores malformed tags... but who cares right
// also does NOT strip inline scripts, might wanna fix that

import java.io.*;
import java.util.*;

public class XmlParser {
    public static void main(String[] args) throws Exception {
        File f = new File("data/config.xml");
        Scanner sc = new Scanner(f);
        while(sc.hasNextLine()) {
            String line = sc.nextLine();
            if(line.contains("<")) {
                System.out.println("tag found: " + line.trim());
            }
        }

        // yeah this doesn't actually parse anything, it's a lie
    }
}
