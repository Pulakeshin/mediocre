using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace BinarySerializationExample
{
    [Serializable]
    class Person
    {
        public string PersonName { get; set; }
        public int Age { get; set; }
        public char Gender { get; set; }
        public bool IsRegisterd { get; set; }

        public Person(string personName,int age,char gender,bool isRegistered)
        {
            PersonName = personName;
            Age = age;
            Gender = gender;
            IsRegisterd = isRegistered;

        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            //Serialization
            Person person = new Person("Pulak",22,'M',true);
            string filePath = "c:\\Capg\\person.txt";
            FileStream fs1 = new FileStream(filePath, FileMode.Open, FileAccess.Write);
            BinaryFormatter binaryFormatter = new BinaryFormatter();
            binaryFormatter.Serialize(fs1, person);
            fs1.Close();
            Console.WriteLine("Serialization Done!!!");
            Console.ReadKey();

            //Deserialization
            Person person2;
            FileStream fs2 = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            person2=(Person)binaryFormatter.Deserialize(fs2);
            Console.WriteLine("Person Name : "+person2.PersonName);
            Console.WriteLine("Person Age : " + person2.Age);
            Console.WriteLine("Person Gender : " + person2.Gender);
            Console.WriteLine("Person Registration : " + person2.IsRegisterd);
            Console.ReadKey();


        }
    }
}
