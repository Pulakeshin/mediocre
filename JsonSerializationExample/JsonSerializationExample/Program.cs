using System;
using System.Collections.Generic;
using System.IO;
using System.Xml.Serialization;
using Newtonsoft.Json;

namespace JsonSerializationExample
{
    [Serializable]
    public class Person
    {
        public string PersonName { get; set; }
        public int Age { get; set; }
        public char Gender { get; set; }
        public bool IsRegisterd { get; set; }

        public Person(string personName, int age, char gender, bool isRegistered)
        {
            PersonName = personName;
            Age = age;
            Gender = gender;
            IsRegisterd = isRegistered;

        }
        public Person()
        {

        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            //Serialization
            Person person = new Person("Pulak", 22, 'M', true);
            string filePath = "c:\\Capg\\person.txt";
            StreamWriter sw=new StreamWriter(filePath);
            string content=JsonConvert.SerializeObject(person);
            sw.Write(content);
            sw.Close();
            Console.WriteLine("Serialization Done!!!");
            Console.ReadKey();

            //Deserialization
            Person person2;
            StreamReader sr = new StreamReader(filePath);
            person2 = JsonConvert.DeserializeObject<Person>(sr.ReadToEnd());
            Console.WriteLine("Person Name : " + person2.PersonName);
            Console.WriteLine("Person Age : " + person2.Age);
            Console.WriteLine("Person Gender : " + person2.Gender);
            Console.WriteLine("Person Registration : " + person2.IsRegisterd);
            Console.ReadKey();


        }
    }
}
