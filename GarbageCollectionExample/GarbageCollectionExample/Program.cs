using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Threading.Tasks;

namespace GarbageCollectionExample
{
    public class Customer:IDisposable
    {
        public int x;
        public int CustomerID { get; set; }
        public string CustomerName { get; set; }
        private FileStream fs;

        public Customer()
        {
            fs = new FileStream(@"c:\Capg\something.txt",FileMode.Create,FileAccess.Write);
            Console.WriteLine("File Opened");
            byte[] barray = System.Text.Encoding.ASCII.GetBytes("Hello");
            fs.Write(barray,0,barray.Length);
        }

        //Dispose
        public void Dispose()
        {
            fs.Close();
            Console.WriteLine("File Closed");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            using (Customer customer=new Customer())
            {

            }

            int x = 10;
        }
    }
}
