using System;
namespace StringExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello".ToUpper()); //2 objects created --> 20bytes
            Console.WriteLine("Hello".ToLower()); //1 object created --> 10 bytes
            Console.WriteLine("Hell"+"o".ToUpper()); //4 objects created --> 30 bytes

            //methods
            string s = "Capgemini";
            int res1 = s.Length;
            Console.WriteLine(res1);
            char res2 = s[0];
            Console.WriteLine(res2);
            Console.WriteLine((int)res2);
            Console.WriteLine(""+res2 +s[1]);

            string res3 = s.Substring(2);
            Console.WriteLine(res3);

            string res4 = s.Substring(3, 3);
            Console.WriteLine(res4);

            string res5 = s.Remove(3,3);
            Console.WriteLine(res5);

            char[] ch = new char[] {(char)65, (char)97, (char)98 };
            string s2 = new string(ch);
            Console.WriteLine(s2);

            int res6 = s.IndexOf("i",2);
            Console.WriteLine(res6);

            string companyName = "Capgemini", location = "Mumbai";

            string res7 = $"{companyName} is located at {location}";
            Console.WriteLine(res7);

            Console.ReadKey();
        }
    }
}