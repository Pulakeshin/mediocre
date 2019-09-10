using System;

namespace TupleExample
{
    class Program
    {
        //Anonymous Object
        static dynamic GetPersonDetails()
        {
            var person = new
            {
                personName = "Scott",
                age = 20,
                email = "abc@email.com",
                dateOfJoining = Convert.ToDateTime("2019-6-10")
            };
            return person;
        }

        //Tuple
        static Tuple<string,int,string,DateTime> GetPersonDetails2()
            {
                var person = new Tuple<string, int, string, DateTime>
                ("Scott",20,"abc@email.com",Convert.ToDateTime("2019-6-10"));
                return person;
            }

        //Value Tuple
        static(string, int, string, DateTime) GetPersonDetails3()
        {
            var person = (personName:"Scott", age:20, email:"abc@email.com", DateOfJoining:Convert.ToDateTime("2019-6-10"));
            return person;
        }

        static void Main()
        {
            //var p = Program.GetPersonDetails3();
            //Console.WriteLine(p.);
            //Console.ReadKey();

            (string personName, int age, _, DateTime dateOfJoining) = Program.GetPersonDetails3();
            Console.WriteLine(out_);
        }
    }
}