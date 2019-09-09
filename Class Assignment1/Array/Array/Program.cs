using System;
using System.Collections.Generic;
using System.Collections;
namespace ArrayExample
{
    class Program
    {
        static void Main()
        {
            //Single dim array

            int[] firstArray = new int[5] { 10, 20, 30, 40, 50 };
            Console.WriteLine("Single dimension array with for loop");
            for (int i = 0; i < firstArray.Length; i++)
            {
            Console.WriteLine(firstArray[i]);
            }

            //Foreach Loop

            Console.WriteLine("Single dimension array with foreach loop");
            foreach(int n in firstArray)
            {
            Console.WriteLine(n);
            }

            //Multi dimension array

            int[,] secondArray = new int[4, 3] { { 10, 20, 30 }, { 40, 50, 60 }, { 70, 80, 90 }, { 100, 101, 102 } };
            Console.WriteLine("Multi Dimension array with for loop");
            for (int i = 0; i < 4; i++)
            {
                for (int j = 0; j < 3; j++)
                {   
                    Console.Write(secondArray[i,j] + "  ");
                }
                Console.WriteLine();
            }

            //jagged array

            int[][] thirdArray = new int[4][];
            thirdArray[0] = new int[3] {1,2,3 }; //row 0
            thirdArray[1] = new int[2] {4,5 }; //row 1
            thirdArray[2] = new int[5] {6,7,8,9,10}; //row 2
            thirdArray[3] = new int[4] {11,12,13,14 }; //row 3
            Console.WriteLine("Jagged array:");

            for (int i = 0; i < 4; i++)
            {
                for (int j = 0; j < thirdArray[i].Length; j++)
                { 
                    Console.Write(thirdArray[i][j] + " ");
                }
                Console.WriteLine();
            }

            //Dictonay
            Dictionary <string,int> marks = new Dictionary<string, int>()
            {
                {"Maths",60 },
                {"Physics",40 },
                {"Chemistry",50 }
            };
            Console.WriteLine("Physics Marks:");
            Console.WriteLine(marks["Physics"]);

            //Hashtable

            Hashtable marks2 = new Hashtable()
            {
                {"Maths",60 },
                {"Physics",40 },
                {"Chemistry",50 },
                {100,'A' }
            };
            Console.WriteLine(marks2[100]);
            foreach(var item in marks2.Keys)
            {
                Console.Write(item + " "); //key
                Console.WriteLine(marks2[item]); //value
            }

            Console.ReadKey();
        }
    }
}