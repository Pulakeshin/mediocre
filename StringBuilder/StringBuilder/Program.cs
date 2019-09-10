using System;
using System.Text;
namespace StringBuilderExample
{
    class Program
    {
        static void Main()
        {
            try
            {
                StringBuilder message = new StringBuilder();
                message.Append("Welcome ");
                message.Append("to ");
                message.Append("Capgemini ");
                message.Append("Mumbai");
                string s = message.ToString(); //Convert string builder to string
                Console.WriteLine(s);
            }
            catch (Exception)
            {
                Console.WriteLine("Some Error");
            }
            

            Console.ReadKey();

        }
    }
}