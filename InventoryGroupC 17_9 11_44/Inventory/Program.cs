using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Inventory.BusinessLayer;
using Inventory.DataAccessLayer;
using Inventory.Entities;
using Inventory.Exceptions;

namespace Inventory.PresentationLayer
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                int temp, flag;
                Console.WriteLine("ENTER CHOICE:");
                Console.WriteLine("1.System User");
                Console.WriteLine("2.Supplier");
                Console.WriteLine("3.Distributor");
                temp = Convert.ToInt32(Console.ReadLine());

                switch (temp)
                {
                    case 1:
                        Console.WriteLine("Which System you want to enter?");
                        Console.WriteLine("1.Supplier");
                        Console.WriteLine("2.Distributor");
                        flag = Convert.ToInt32(Console.ReadLine());
                        if (flag == 1)
                        {
                            int choice1;
                            do
                            {
                                PrintSupplierMenu();
                                Console.WriteLine("Enter your Choice:");
                                choice1 = Convert.ToInt32(Console.ReadLine());
                                switch (choice1)
                                {
                                    case 1:
                                        AddSupplier();
                                        break;
                                    case 2:
                                        ListAllSupplier();
                                        break;
                                    case 3:
                                        SearchSupplierByID();
                                        break;
                                    case 4:
                                        UpdateSupplier();
                                        break;
                                    case 5:
                                        DeleteSupplier();
                                        break;
                                    case 6:
                                        return;
                                    default:
                                        Console.WriteLine("Invalid Choice");
                                        break;
                                }
                            } while (choice1 != -1);
                        }
                        else if (flag == 2)
                        {
                            int choice2;
                            do
                            {
                                PrintMenuDistributor();
                                Console.WriteLine("Enter your Choice:");
                                choice2 = Convert.ToInt32(Console.ReadLine());
                                switch (choice2)
                                {
                                    case 1:
                                        AddDistributor();
                                        break;
                                    case 2:
                                        ListAllDistributors();
                                        break;
                                    case 3:
                                        SearchDistributorByID();
                                        break;
                                    case 4:
                                        UpdateDistributor();
                                        break;
                                    case 5:
                                        DeleteDistributor();
                                        break;
                                    case 6:
                                        return;
                                    default:
                                        Console.WriteLine("Invalid Choice");
                                        break;
                                }
                            } while (choice2 != -1);
                        }
                        else
                            Console.WriteLine("Invalid choice");
                        break;
                    case 2:
                        int choice3;
                        do
                        {
                            PrintSupplierAddressMenu();
                            Console.WriteLine("Enter your Choice:");
                            choice3 = Convert.ToInt32(Console.ReadLine());
                            switch (choice3)
                            {
                                case 1:
                                    AddSupplierAddress();
                                    break;
                                case 2:
                                    ListAllSupplierAddress();
                                    break;
                                case 3:
                                    SearchSupplierAddressByID();
                                    break;
                                case 4:
                                    UpdateSupplierAddress();
                                    break;
                                case 5:
                                    DeleteSupplierAddress();
                                    break;
                                default:
                                    Console.WriteLine("Invalid Choice");
                                    break;
                            }
                        } while (choice3 != -1);
                        break;
                    case 3:
                        int choice;
                        do
                        {
                            PrintAddressMenu();
                            Console.WriteLine("Enter your Choice:");
                            choice = Convert.ToInt32(Console.ReadLine());
                            switch (choice)
                            {
                                case 1:
                                    AddDistributorAddress();
                                    break;
                                case 2:
                                    ListAllDistributorsAddress();
                                    break;
                                case 3:
                                    SearchDistributorAddressByID();
                                    break;
                                case 4:
                                    UpdateDistributorAddress();
                                    break;
                                case 5:
                                    DeleteDistributorAddress();
                                    break;
                                default:
                                    Console.WriteLine("Invalid Choice");
                                    break;
                            }
                        } while (choice != -1);
                        break;
                    default:
                        Console.WriteLine("Invalid Input");
                        break;
                }
            }
            catch (Exception)
            {

                Console.WriteLine("Please input a key");
            }
            
        }

        private static void DeleteDistributor()
        {
            try
            {
                int deleteDistributorID;
                Console.WriteLine("Enter DistributorID to Delete:");
                deleteDistributorID = Convert.ToInt32(Console.ReadLine());
                Distributor deleteDistributor = DistributorBL.SearchDistributorBL(deleteDistributorID);
                if (deleteDistributor != null)
                {
                    bool distributordeleted = DistributorBL.DeleteDistributorBL(deleteDistributorID);
                    if (distributordeleted)
                        Console.WriteLine("Distributor Deleted");
                    else
                        Console.WriteLine("Distributor not Deleted ");
                }
                else
                {
                    Console.WriteLine("No Distributor Details Available");
                }


            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void UpdateDistributor()
        {
            try
            {
                int updateDistributorID;
                Console.WriteLine("Enter DistributorID to Update Details:");
                updateDistributorID = Convert.ToInt32(Console.ReadLine());
                Distributor updatedDistributor = DistributorBL.SearchDistributorBL(updateDistributorID);
                if (updatedDistributor != null)
                {
                    Console.WriteLine("Update Distributor Name :");
                    updatedDistributor.DistributorName = Console.ReadLine();
                    Console.WriteLine("Update PhoneNumber :");
                    updatedDistributor.DistributorContactNumber = Console.ReadLine();
                    bool distributorUpdated = DistributorBL.UpdateDistributorBL(updatedDistributor);
                    if (distributorUpdated)
                        Console.WriteLine("Distributor Details Updated");
                    else
                        Console.WriteLine("Distributor Details not Updated ");
                }
                else
                {
                    Console.WriteLine("No Distributor Details Available");
                }


            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void SearchDistributorByID()
        {
            try
            {
                int searchDistributorID;
                Console.WriteLine("Enter Distributor ID to Search:");
                searchDistributorID = Convert.ToInt32(Console.ReadLine());
                Distributor searchDistributor = DistributorBL.SearchDistributorBL(searchDistributorID);
                if (searchDistributor != null)
                {
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("DistributorID\t\tDistributor Name\t\tPhoneNumber");
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("{0}\t\t{1}\t\t{2}", searchDistributor.DistributorID, searchDistributor.DistributorName, searchDistributor.DistributorContactNumber);
                    Console.WriteLine("******************************************************************************");
                }
                else
                {
                    Console.WriteLine("No Distributor Details Available");
                }

            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void ListAllDistributors()
        {
            try
            {
                List<Distributor> distributorList = DistributorBL.GetAllDistributorsBL();
                if (distributorList != null)
                {
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("Distributor ID\t\tDistributor Name\t\tPhoneNumber");
                    Console.WriteLine("******************************************************************************");
                    foreach (Distributor distributor in distributorList)
                    {
                        Console.WriteLine("{0}\t\t{1}\t\t{2}", distributor.DistributorID, distributor.DistributorName, distributor.DistributorContactNumber);
                    }
                    Console.WriteLine("******************************************************************************");

                }
                else
                {
                    Console.WriteLine("No Guest Details Available");
                }
            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void AddDistributor()
        {
            try
            {
                Distributor distributor = new Distributor();
                Console.WriteLine("Enter Distributor ID :");
                distributor.DistributorID = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter Distributor Name :");
                distributor.DistributorName = Console.ReadLine();
                Console.WriteLine("Enter PhoneNumber :");
                distributor.DistributorContactNumber = Console.ReadLine();
                Console.WriteLine("Enter Email ID :");
                distributor.DistributorEmail = Console.ReadLine();

                bool distributorAdded = DistributorBL.AddDistributorBL(distributor);
                if (distributorAdded)
                    Console.WriteLine("Distributor Added");
                else
                    Console.WriteLine("Distributor not Added");
            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void PrintMenuDistributor()
        {
            Console.WriteLine("\n***********Distributor***********");
            Console.WriteLine("1. Add Distributor");
            Console.WriteLine("2. List All Distributor");
            Console.WriteLine("3. Search Distributor by ID");
            Console.WriteLine("4. Update Distributor");
            Console.WriteLine("5. Delete Distributor");
            Console.WriteLine("6. Exit");
            Console.WriteLine("******************************************\n");

        }

        private static void AddDistributorAddress()
        {
            try
            {
                DistributorAddress distributorAddress = new DistributorAddress();
                Console.WriteLine("Enter Distributor Address ID :");
                distributorAddress.DistributorAddressID = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter Distributor Address Line1 :");
                distributorAddress.DistributorAddressLine1 = Console.ReadLine();
                Console.WriteLine("Enter Distributor Address Line2 :");
                distributorAddress.DistributorAddressLine2 = Console.ReadLine();
                Console.WriteLine("Enter Distributor City :");
                distributorAddress.DistributorCity = Console.ReadLine();
                Console.WriteLine("Enter Distributor State :");
                distributorAddress.DistributorState = Console.ReadLine();
                Console.WriteLine("Enter Pincode :");
                distributorAddress.DistributorPincode = Console.ReadLine();
                bool distributorAddressAdded = DistributorAddressBL.AddDistributorAddressBL(distributorAddress);
                if (distributorAddressAdded)
                    Console.WriteLine("Distributor Address Added");
                else
                    Console.WriteLine("Distributor Address not Added");
            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void DeleteDistributorAddress()
        {
            try
            {
                int deleteDistributorAddressID;
                Console.WriteLine("Enter DistributorAddressID to Delete:");
                deleteDistributorAddressID = Convert.ToInt32(Console.ReadLine());
                DistributorAddress deleteDistributorAddress = DistributorAddressBL.SearchDistributorAddressBL(deleteDistributorAddressID);
                if (deleteDistributorAddress != null)
                {
                    bool distributorAddressdeleted = DistributorAddressBL.DeleteDistributorAddressBL(deleteDistributorAddressID);
                    if (distributorAddressdeleted)
                        Console.WriteLine("Distributor Address Deleted");
                    else
                        Console.WriteLine("Distributor Address not Deleted ");
                }
                else
                {
                    Console.WriteLine("No Distributor Address Details Available");
                }


            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void UpdateDistributorAddress()
        {
            try
            {
                int updateDistributorAddressID;
                Console.WriteLine("Enter DistributorAddressID to Update Details:");
                updateDistributorAddressID = Convert.ToInt32(Console.ReadLine());
                DistributorAddress updatedDistributorAddress = DistributorAddressBL.SearchDistributorAddressBL(updateDistributorAddressID);
                if (updatedDistributorAddress != null)
                {
                    Console.WriteLine("Update Address Line1 :");
                    updatedDistributorAddress.DistributorAddressLine1 = Console.ReadLine();
                    Console.WriteLine("Update Address Line2 :");
                    updatedDistributorAddress.DistributorAddressLine2 = Console.ReadLine();
                    Console.WriteLine("Update City :");
                    updatedDistributorAddress.DistributorCity = Console.ReadLine();
                    Console.WriteLine("Update State :");
                    updatedDistributorAddress.DistributorState = Console.ReadLine();
                    Console.WriteLine("Update Pincode :");
                    updatedDistributorAddress.DistributorPincode = Console.ReadLine();
                    bool distributorAddressUpdated = DistributorAddressBL.UpdateDistributorAddressBL(updatedDistributorAddress);
                    if (distributorAddressUpdated)
                        Console.WriteLine("Distributor Address Details Updated");
                    else
                        Console.WriteLine("Distributor Address Details not Updated ");
                }
                else
                {
                    Console.WriteLine("No Distributor Address Details Available");
                }


            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void SearchDistributorAddressByID()
        {
            try
            {
                int searchDistributorAddressID;
                Console.WriteLine("Enter Distributor Address ID to Search:");
                searchDistributorAddressID = Convert.ToInt32(Console.ReadLine());
                DistributorAddress searchDistributorAddress = DistributorAddressBL.SearchDistributorAddressBL(searchDistributorAddressID);
                if (searchDistributorAddress != null)
                {
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("DistributorAddressID\t\tAddress Line1\t\tAddress Line2\t\tCity\t\tState\t\tPincode");
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("{0}\t\t{1}\t\t{2}\t\t{3}\t\t{4}", searchDistributorAddress.DistributorAddressID, searchDistributorAddress.DistributorAddressLine1, searchDistributorAddress.DistributorAddressLine2, searchDistributorAddress.DistributorCity, searchDistributorAddress.DistributorState, searchDistributorAddress.DistributorPincode);
                    Console.WriteLine("******************************************************************************");
                }
                else
                {
                    Console.WriteLine("No Distributor Address Details Available");
                }

            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void ListAllDistributorsAddress()
        {
            try
            {
                List<DistributorAddress> distributorAddressList = DistributorAddressBL.GetAllDistributorAddressBL();
                if (distributorAddressList != null)
                {
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("DistributorAddressID\t\tAddress Line1\t\tAddress Line2\t\tCity\t\tState\t\tPincode");
                    Console.WriteLine("******************************************************************************");
                    foreach (DistributorAddress distributorAddress in distributorAddressList)
                    {
                        Console.WriteLine("{0}\t\t{1}\t\t{2}\t\t{3}\t\t{4}", distributorAddress.DistributorAddressID, distributorAddress.DistributorAddressLine1, distributorAddress.DistributorAddressLine2, distributorAddress.DistributorCity, distributorAddress.DistributorState, distributorAddress.DistributorPincode);
                    }
                    Console.WriteLine("******************************************************************************");

                }
                else
                {
                    Console.WriteLine("No Guest Details Available");
                }
            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void PrintAddressMenu()
        {
            Console.WriteLine("\n***********Distributor***********");
            Console.WriteLine("1. Add Distributor Address");
            Console.WriteLine("2. List All Distributor Address");
            Console.WriteLine("3. Search Distributor by ID");
            Console.WriteLine("4. Update Distributor Address");
            Console.WriteLine("5. Delete Distributor Address");
            Console.WriteLine("6. Exit");
            Console.WriteLine("******************************************\n");

        }

        private static void PrintSupplierMenu()
        {
            Console.WriteLine("\n***********Supplier***********");
            Console.WriteLine("1. Add Supplier");
            Console.WriteLine("2. List All Supplier");
            Console.WriteLine("3. Search Supplier by ID");
            Console.WriteLine("4. Update Supplier");
            Console.WriteLine("5. Delete Supplier");
            Console.WriteLine("6. Exit");
            Console.WriteLine("******************************************\n");

        }

        private static void PrintSupplierAddressMenu()
        {
            Console.WriteLine("\n***********Distributor***********");
            Console.WriteLine("1. Add Supplier Address");
            Console.WriteLine("2. List All Supplier Address");
            Console.WriteLine("3. Search Supplier by ID");
            Console.WriteLine("4. Update Supplier Address");
            Console.WriteLine("5. Delete Supplier Address");
            Console.WriteLine("6. Exit");
            Console.WriteLine("******************************************\n");

        }

        private static void AddSupplier()
        {
            try
            {
                Supplier supplier = new Supplier();
                Console.WriteLine("Enter Supplier ID :");
                supplier.SupplierId = Console.ReadLine();
                Console.WriteLine("Enter Supplier Name :");
                supplier.SupplierName = Console.ReadLine();
                Console.WriteLine("Enter PhoneNumber :");
                supplier.SupplierPhone = Console.ReadLine();
                Console.WriteLine("Enter Email ID :");
                supplier.SupplierEmail = Console.ReadLine();

                bool supplierAdded = SupplierBL.AddSupplierBL(supplier);
                if (supplierAdded)
                    Console.WriteLine("Supplier Added");
                else
                    Console.WriteLine("Supplier not Added");
            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void ListAllSupplier()
        {
            try
            {
                List<Supplier> supplierList = SupplierBL.GetAllSupplierBL();
                if (supplierList != null)
                {
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("Supplier ID\t\tSupplier Name\t\tPhoneNumber");
                    Console.WriteLine("******************************************************************************");
                    foreach (Supplier supplier in supplierList)
                    {
                        Console.WriteLine("{0}\t\t{1}\t\t{2}", supplier.SupplierId, supplier.SupplierName, supplier.SupplierPhone);
                    }
                    Console.WriteLine("******************************************************************************");

                }
                else
                {
                    Console.WriteLine("No Details Available");
                }
            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void SearchSupplierByID()
        {
            try
            {
                int searchSupplierID;
                Console.WriteLine("Enter Supplier ID to Search:");
                searchSupplierID = Convert.ToInt32(Console.ReadLine());
                Supplier searchSupplier = SupplierBL.SearchSupplierBL(searchSupplierID);
                if (searchSupplier != null)
                {
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("SupplierID\t\tSupplier Name\t\tPhoneNumber");
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("{0}\t\t{1}\t\t{2}", searchSupplier.SupplierId, searchSupplier.SupplierName, searchSupplier.SupplierPhone);
                    Console.WriteLine("******************************************************************************");
                }
                else
                {
                    Console.WriteLine("No Supplier Details Available");
                }

            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void UpdateSupplier()
        {
            try
            {
                int updateSupplierID;
                Console.WriteLine("Enter SupplierID to Update Details:");
                updateSupplierID = Convert.ToInt32(Console.ReadLine());
                Supplier updatedSupplier = SupplierBL.SearchSupplierBL(updateSupplierID);
                if (updatedSupplier != null)
                {
                    Console.WriteLine("Update Supplier Name :");
                    updatedSupplier.SupplierName = Console.ReadLine();
                    Console.WriteLine("Update PhoneNumber :");
                    updatedSupplier.SupplierPhone = Console.ReadLine();
                    bool supplierUpdated = SupplierBL.UpdateSupplierBL(updatedSupplier);
                    if (supplierUpdated)
                        Console.WriteLine("Supplier Details Updated");
                    else
                        Console.WriteLine("Supplier Details not Updated ");
                }
                else
                {
                    Console.WriteLine("No Supplier Details Available");
                }


            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void DeleteSupplier()
        {
            try
            {
                string deleteSupplierID;
                Console.WriteLine("Enter SupplierID to Delete:");
                deleteSupplierID = Console.ReadLine();
                Supplier deleteSupplier = SupplierBL.SearchSupplierBL(int.Parse(deleteSupplierID));
                if (deleteSupplier != null)
                {
                    bool supplierdeleted = SupplierBL.DeleteSupplierBL(deleteSupplierID);
                    if (supplierdeleted)
                        Console.WriteLine("Supplier Deleted");
                    else
                        Console.WriteLine("Supplier not Deleted ");
                }
                else
                {
                    Console.WriteLine("No Supplier Details Available");
                }


            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //Suplier address 
        private static void AddSupplierAddress()
        {
            try
            {
                SupplierAddress supplierAddress = new SupplierAddress();
                Console.WriteLine("Enter Supplier Address ID :");
                supplierAddress.SupplierAddressId = Console.ReadLine();
                Console.WriteLine("Enter Supplier Address Line1 :");
                supplierAddress.SupplierAddressLine1 = Console.ReadLine();
                Console.WriteLine("Enter Supplier Address Line2 :");
                supplierAddress.SupplierAddressLine2 = Console.ReadLine();
                Console.WriteLine("EnterSupplier City :");
                supplierAddress.SupplierCity = Console.ReadLine();
                Console.WriteLine("Enter Supplier State :");
                supplierAddress.SupplierState = Console.ReadLine();
                Console.WriteLine("Enter Pincode :");
                supplierAddress.SupplierPin = Console.ReadLine();
                bool supplierAddressAdded = SupplierAddressBL.AddSupplierAddressBL(supplierAddress);
                if (supplierAddressAdded)
                    Console.WriteLine("Supplier Address Added");
                else
                    Console.WriteLine("Supplier Address not Added");
            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void DeleteSupplierAddress()
        {
            try
            {
                string deleteSupplierAddressID;
                Console.WriteLine("Enter SupplierAddressID to Delete:");
                deleteSupplierAddressID = Console.ReadLine();
                SupplierAddress deleteSupplierAddress = SupplierAddressBL.SearchSupplierAddressBL(int.Parse(deleteSupplierAddressID));
                if (deleteSupplierAddress != null)
                {
                    bool supplierAddressdeleted = SupplierAddressBL.DeleteSupplierAddressBL(deleteSupplierAddressID);
                    if (supplierAddressdeleted)
                        Console.WriteLine("Supplier Address Deleted");
                    else
                        Console.WriteLine("Supplier Address not Deleted ");
                }
                else
                {
                    Console.WriteLine("No Supplier Address Details Available");
                }


            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void UpdateSupplierAddress()
        {
            try
            {
                string updateSupplierAddressID;
                Console.WriteLine("Enter SupplierAddressID to Update Details:");
                updateSupplierAddressID = Console.ReadLine();
                SupplierAddress updatedSupplierAddress = SupplierAddressBL.SearchSupplierAddressBL(int.Parse(updateSupplierAddressID));
                if (updatedSupplierAddress != null)
                {
                    Console.WriteLine("Update Address Line1 :");
                    updatedSupplierAddress.SupplierAddressLine1 = Console.ReadLine();
                    Console.WriteLine("Update Address Line2 :");
                    updatedSupplierAddress.SupplierAddressLine2 = Console.ReadLine();
                    Console.WriteLine("Update City :");
                    updatedSupplierAddress.SupplierCity = Console.ReadLine();
                    Console.WriteLine("Update State :");
                    updatedSupplierAddress.SupplierState = Console.ReadLine();
                    Console.WriteLine("Update Pincode :");
                    updatedSupplierAddress.SupplierPin = Console.ReadLine();
                    bool supplierAddressUpdated = SupplierAddressBL.UpdateSupplierAddressBL(updatedSupplierAddress);
                    if (supplierAddressUpdated)
                        Console.WriteLine("Supplier Address Details Updated");
                    else
                        Console.WriteLine("Supplier Address Details not Updated ");
                }
                else
                {
                    Console.WriteLine("No Supplier Address Details Available");
                }


            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void SearchSupplierAddressByID()
        {
            try
            {
                int searchSupplierAddressID;
                Console.WriteLine("Enter Supplier Address ID to Search:");
                searchSupplierAddressID = Convert.ToInt32(Console.ReadLine());
                SupplierAddress searchSupplierAddress = SupplierAddressBL.SearchSupplierAddressBL(searchSupplierAddressID);
                if (searchSupplierAddress != null)
                {
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("SupplierAddressID\t\tAddress Line1\t\tAddress Line2\t\tCity\t\tState\t\tPincode");
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("{0}\t\t{1}\t\t{2}\t\t{3}\t\t{4}", searchSupplierAddress.SupplierAddressId, searchSupplierAddress.SupplierAddressLine1, searchSupplierAddress.SupplierAddressLine2, searchSupplierAddress.SupplierCity, searchSupplierAddress.SupplierState, searchSupplierAddress.SupplierPin);
                    Console.WriteLine("******************************************************************************");
                }
                else
                {
                    Console.WriteLine("No Supplier Address Details Available");
                }

            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void ListAllSupplierAddress()
        {
            try
            {
                List<SupplierAddress> supplierAddressList = SupplierAddressBL.GetAllSupplierAddressBL();
                if (supplierAddressList != null)
                {
                    Console.WriteLine("******************************************************************************");
                    Console.WriteLine("SupplierAddressID\t\tAddress Line1\t\tAddress Line2\t\tCity\t\tState\t\tPincode");
                    Console.WriteLine("******************************************************************************");
                    foreach (SupplierAddress supplierAddress in supplierAddressList)
                    {
                        Console.WriteLine("{0}\t\t{1}\t\t{2}\t\t{3}\t\t{4}", supplierAddress.SupplierAddressId, supplierAddress.SupplierAddressLine1, supplierAddress.SupplierAddressLine2, supplierAddress.SupplierCity, supplierAddress.SupplierState, supplierAddress.SupplierPin);
                    }
                    Console.WriteLine("******************************************************************************");

                }
                else
                {
                    Console.WriteLine("No  Details Available");
                }
            }
            catch (InventoryException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
 }

