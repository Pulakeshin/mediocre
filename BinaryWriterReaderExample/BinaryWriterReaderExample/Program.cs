using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BinaryWriterReaderExample
{
    class Person
    {
        
    }
    class Program
    {
        static void Main(string[] args)
        {
            string personName="Pulak Sinha";
            int age = 22;
            char gender = 'M';
            bool isRegisterd = true;

            string filePath = @"c:\Capg\person.txt";
            FileStream fs1 = new FileStream(filePath,FileMode.Create,FileAccess.Write);
            BinaryWriter bw = new BinaryWriter(fs1);
            bw.Write(personName);
            bw.Write(age);
            bw.Write(gender);
            bw.Write(isRegisterd);
            bw.Close();
            Console.WriteLine("File Created");
            Console.ReadKey();

            FileStream fs2 = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs2);
            string pn = br.ReadString();
            int ag = br.ReadInt32();
            char gen = br.ReadChar();
            bool reg = br.ReadBoolean();

            Console.WriteLine("Person Name : "+pn);
            Console.WriteLine("Age : "+ag);
            Console.WriteLine("Gender : "+gen);
            Console.WriteLine("Resgistration : "+reg);

            Console.ReadKey();
        }
    }
}
