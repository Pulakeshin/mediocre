using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Security.Cryptography;
namespace SymmetricEncryptionExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the message to encrypt:");
            string message = Console.ReadLine();
            byte[] iv = Encrypt(message,"c:\\Capg\\personinfo.txt");
            Decrypt(iv, "c:\\Capg\\personinfo.txt");
            Console.ReadKey();
        }

        static byte[] Encrypt(string message, string fileName)
        {
            AesManaged aesAlgorithm = new AesManaged();
            aesAlgorithm.Key=Encoding.ASCII.GetBytes("abcdefghijklmnop");
            ICryptoTransform encryptor = aesAlgorithm.CreateEncryptor(aesAlgorithm.Key,aesAlgorithm.IV);
            using (MemoryStream ms=new MemoryStream())
            {
                using (CryptoStream cs=new CryptoStream(ms,encryptor,CryptoStreamMode.Write))
                {
                    using (StreamWriter sw = new StreamWriter(cs))
                    {
                        sw.WriteLine(message);
                    }
                }
                byte[] encrypedData = ms.ToArray();
                File.WriteAllBytes(fileName,encrypedData);
            }
            return aesAlgorithm.IV;
        }

        static void Decrypt(byte[]iv,string fileName)
        {
            AesManaged aesAlgorithm = new AesManaged();
            aesAlgorithm.Key = Encoding.ASCII.GetBytes("abcdefghijklmnop");
            aesAlgorithm.IV = iv;

            ICryptoTransform decryptor = aesAlgorithm.CreateDecryptor(aesAlgorithm.Key,aesAlgorithm.IV);
            byte[] encryptedDataBuffer = File.ReadAllBytes(fileName);
            using (MemoryStream ms = new MemoryStream(encryptedDataBuffer))
            {
                using (CryptoStream cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                {
                    using (StreamReader sw = new StreamReader(cs))
                    {
                        string actualMessage = sw.ReadToEnd();
                        Console.WriteLine("\nYour Message is:");
                        Console.WriteLine(actualMessage);
                    }
                }
                byte[] encrypedData = ms.ToArray();
                File.WriteAllBytes(fileName, encrypedData);
            }
        }
    }
}
