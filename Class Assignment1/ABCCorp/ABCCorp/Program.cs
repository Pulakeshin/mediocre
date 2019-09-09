using System;
using System.Collections.Generic;
using System.IO;

namespace ABCCorp
{
    class InvalidCreditLimit : Exception
    {
        public InvalidCreditLimit(string message) : base(message)
        {

        }
    }
    class Customer
    {
        private string _customerID;
        private string _customerName;
        private string _address;
        private string _city;
        private string _phone;
        private int _creditLimit;

        //DefaultConstructor
        public Customer()
        {
            
        }

        //Parameterised Constuctor
        public Customer(string customerID,string customerName,string address,string city,string phone,int creditLimit)
        {
            CustomerID = customerID;
            CustomerName = customerName;
            Address = address;
            City = city;
            Phone = phone;
            CreditLimit = creditLimit;
        }

        //Properties
        public string CustomerID
        {
            set
            {
                _customerID = value;
            }
            get
            {
                return _customerID;
            }
        }

        public string CustomerName
        {
            set
            {
                _customerName = value;
            }
            get
            {
                return _customerName;
            }
        }

        public string Address
        {
            set
            {
                _address = value;
            }
            get
            {
                return _address;
            }
        }

        public string City
        {
            set
            {
                _city = value;
            }
            get
            {
                return _city;
            }
        }

        public string Phone
        {
            set
            {
                _phone = value;
            }
            get
            {
                return _phone;
            }
        }

        public int CreditLimit
        {
            set
            {
                if (value<50000)
                {
                    _creditLimit = value;
                }
                else
                {
                    throw new InvalidCreditLimit("Credit Limit Exceeded");
                }
            }
            get
            {
                return _creditLimit;
            }
        }
    }
    class Program
    {
        static void Main()
        {
            try
            {
                //Customer customer = new Customer("1652", "pulak", "cuttack", "7645367265", "loki", 58444);
                Customer customer = new Customer();

                Console.WriteLine("Enter Customer ID :");
                customer.CustomerID = Console.ReadLine();
                Console.WriteLine("Enter Customer Name :");
                customer.CustomerName = Console.ReadLine();
                Console.WriteLine("Enter Customer Address :");
                customer.Address = Console.ReadLine();
                Console.WriteLine("Enter Customer City :");
                customer.City = Console.ReadLine();
                Console.WriteLine("Enter Phone number :");
                customer.Phone = Console.ReadLine();
                Console.WriteLine("Enter Credit :");
                customer.CreditLimit = Convert.ToInt32(Console.ReadLine());
            }
            catch (Exception ex)
            {
                string content = $"\n\n{DateTime.Now}" +
                   $"\nMessage :{ex.Message}" +
                   $"\nType :{ex.GetType().ToString()}";

                Console.WriteLine(content);

            }

            finally
            {
                if ()
                {

                }
                Console.WriteLine("\nWARNING : Credit should be less than 50000");
            }

            Console.ReadKey();
        }
    }
}
