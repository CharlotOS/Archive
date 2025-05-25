// ok so this was for fast merging reports but it leaves temp files now?
// like, only on some drives... anyone checked on EFS? 

using System;
using System.IO;

class Merger
{
    static void Main()
    {
        string[] files = Directory.GetFiles("./reports", "*.json");
        string output = "";

        foreach (string file in files)
        {
            try
            {
                string data = File.ReadAllText(file);
                output += data + "\n";
            }
            catch
            {
                Console.WriteLine("skip broken file?");
            }
        }

        // this used to go into archive dir, dunno who changed that
        File.WriteAllText("merged_report.json", output);
        Console.WriteLine("done (hopefully)");
    }
}
