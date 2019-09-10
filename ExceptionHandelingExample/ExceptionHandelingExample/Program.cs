using System;
using System.Collections.Generic;
using System.IO;

namespace ExceptionHandelingExample
{
    class StringLengthException: Exception
    {
        public StringLengthException(string message):base(message)
        {

        }
    }
    class Customer
    {
        private string _customerName;
        private string _mobile;
        private int _age;

        //properties
        public string CustomerName
        {
            set
            {
                if (value.Length<=30)
                {
                    _customerName = value;
                }
                else
                {
                    throw new StringLengthException("Customer Name should be less than 30 characters");
                }
            }
            get
            {
                return _customerName;
            }
        }

        public string Mobile
        {
            set
            {
                _mobile = value;
            }
            get
            {
                return _mobile;
            }
        }

        public int Age
        {
            set
            {
                _age = value;
            }
            get
            {
                return _age;
            }
        }

        static void Main()
        {
            try
            {
                Customer customer = new Customer();
                Console.WriteLine("Enter Customer Name:");
                customer.CustomerName=Console.ReadLine();
                Console.WriteLine("Enter Customer Mobile number:");
                customer.Mobile = Console.ReadLine();
                Console.WriteLine("Enter Customer Age:");
                customer.Age = Convert.ToInt32(Console.ReadLine());

                Console.WriteLine("\n Customer Details");
                Console.WriteLine("Customer Name : "+ customer.CustomerName);
                Console.WriteLine("Customer Mobile number : " + customer.Mobile);
                Console.WriteLine("Customer Age : " + customer.Age);

            }
            catch (FormatException ex) //FormatException
            {
               
                //byte[] barray = System.Text.Encoding.ASCII.GetBytes(content);
                //fs.Write(barray,0,barray.Length);
                //fs.Close();
            }

            catch (OverflowException ex) //OverflowException
            {
                Console.WriteLine("Larger or smaller value is entered");
            }

            catch(Exception ex) //Exception
            {
                Console.WriteLine("Unexpected error occured, please try again!!!");
                FileInfo fi = new FileInfo(@"c:\Capg\Log.txt");
                if (fi.Exists == false)
                {
                    fi.Create();
                }

                //FileStream fs = new FileStream(@"c:\Capg\Log.txt", FileMode.Append, FileAccess.Write);
                string content = $"\n\n{DateTime.Now}" +
                    $"\n Message :{ex.Message}" +
                    $"\n Stack Trace :{ex.StackTrace}" +
                    $"\n Inner Exception :{ex.InnerException?.Message}" +
                    $"\nType :{ex.GetType().ToString()}";

                StreamWriter sw = new StreamWriter(@"c:\Capg\Log.txt", true);
                sw.Write(content);
                sw.Close();

                StreamReader sr = new StreamReader(@"c:\Capg\Log.txt", true);
                Console.WriteLine(sr.ReadToEnd());
                sr.Close();
            }

            finally
            {
                Console.WriteLine("Thanks");
            }

            Console.ReadKey();
        }
    }
}
