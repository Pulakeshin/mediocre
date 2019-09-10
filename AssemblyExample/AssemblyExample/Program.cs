using System;
using System.Reflection;
using SampleNamespace;

namespace AssemblyExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Customer customer = new Customer();
            customer.CustomerName = "Pulak";
            Console.WriteLine("Before : " + customer.CustomerName);
            Console.WriteLine("After : " + customer.GetCustomerNameUpperCase()); ;

            //Reflection: Obtaining types from assembly
            Assembly assembly = Assembly.GetAssembly(typeof(Customer));
            Console.WriteLine("Full Name : " + assembly.FullName);
            Console.WriteLine("Code Base : " + assembly.CodeBase);

            Type[] classes = assembly.GetTypes();
            foreach (Type n in classes)
            {
                Console.WriteLine(n.Name);
                Console.WriteLine(n.FullName);

                Console.WriteLine("\nProperties:");
                foreach (PropertyInfo prop in n.GetProperties())
                {
                    Console.WriteLine(prop);
                }

                Console.WriteLine("\nMethods:");
                foreach (MethodInfo met in n.GetMethods())
                {
                    Console.WriteLine(met);
                }

                Console.WriteLine("\nFields:");
                foreach (FieldInfo fie in n.GetFields())
                {
                    Console.WriteLine(fie);
                }

                Console.WriteLine("\nAttributes:");
                foreach (Attribute attr in n.GetCustomAttributes())
                {
                    Console.WriteLine(attr);
                }

                Console.ReadKey();
            }
        }

    }
}