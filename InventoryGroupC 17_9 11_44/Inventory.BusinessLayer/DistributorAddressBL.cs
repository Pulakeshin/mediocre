using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Inventory.DataAccessLayer;
using Inventory.Entities;
using Inventory.Exceptions;
using System.Text.RegularExpressions;

namespace Inventory.BusinessLayer
{
    public class DistributorAddressBL
    {
        //Validate Distributor Address Details
        private static bool ValidateDistributorAddress(DistributorAddress distributorAddress)
        {
            
            StringBuilder sb = new StringBuilder();
            bool validDistributorAddress = true;
            Regex regex1 = new Regex("^[1-9]{1}[0-9]{3}$");
            if ((!regex1.IsMatch(Convert.ToString(distributorAddress.DistributorAddressID)))||distributorAddress.DistributorAddressID <=0)
            {
                validDistributorAddress = false;
                sb.Append(Environment.NewLine + "Invalid Distributor ID");
            }
            Regex regex2 = new Regex("^[a-zA-Z0-9-/,]{9,30}$");
            if ((!regex2.IsMatch(distributorAddress.DistributorAddressLine1))||distributorAddress.DistributorAddressLine1 == string.Empty)
            {
                validDistributorAddress = false;
                sb.Append(Environment.NewLine + "Address Line1 Required or error due to special characters inputed");
            }
            Regex regex3 = new Regex("^[a-zA-Z0-9-/,]{9,30}$");
            if ((!regex3.IsMatch(distributorAddress.DistributorAddressLine2)) || distributorAddress.DistributorAddressLine2 == string.Empty)
            {
                validDistributorAddress = false;
                sb.Append(Environment.NewLine + "Address Line2 Required or error due to special characters inputed");
            }
            Regex regex4 = new Regex("^[a-zA-Z0-9-/,]{9,30}$");
            if ((!regex4.IsMatch(distributorAddress.DistributorAddressLine2)) || distributorAddress.DistributorAddressLine2 == string.Empty)
            {
                validDistributorAddress = false;
                sb.Append(Environment.NewLine + "Address Line2 Required or error due to special characters inputed");
            }
            Regex regex5 = new Regex("^[a-zA-Z0-9-/,]{9,30}$");
            if ((!regex5.IsMatch(distributorAddress.DistributorCity)) || distributorAddress.DistributorCity == string.Empty)
            {
                validDistributorAddress = false;
                sb.Append(Environment.NewLine + "Address Line2 Required or error due to special characters inputed");
            }
            Regex regex6 = new Regex("^[1-9]{1}[0-9]{5}$");
            if ((!regex6.IsMatch(distributorAddress.DistributorPincode)) || distributorAddress.DistributorPincode.Length < 6)
            {
                validDistributorAddress = false;
                sb.Append(Environment.NewLine + "Required 6 Digit Pincode");
            }
            if (validDistributorAddress == false)
                throw new InventoryException(sb.ToString());
            return validDistributorAddress;
        }

        //Validating & Adding Distributor Address
        public static bool AddDistributorAddressBL(DistributorAddress newdistributorAddress)
        {
            bool distributorAddressAdded=false;
            try
            {
                if (ValidateDistributorAddress(newdistributorAddress))
                {
                    DistributorAddressDAL distributorAddressDAL = new DistributorAddressDAL();
                    distributorAddressAdded = distributorAddressDAL.AddDistributorAddressDAL(newdistributorAddress);
                }
            }
            catch (InventoryException)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return distributorAddressAdded;
        }

        //Returning complete list of distributor address
        public static List<DistributorAddress> GetAllDistributorAddressBL()
        {
            List<DistributorAddress> distributorAddressList = null;
            try
            {
                DistributorAddressDAL distributorAddressDAL = new DistributorAddressDAL();
                distributorAddressList = distributorAddressDAL.GetAllDistributorAddressDAL();
            }
            catch (InventoryException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return distributorAddressList;
        }

        //Searching Distributor Address by distributor ID
        public static DistributorAddress SearchDistributorAddressBL(int searchDistributorAddressID)
        {
            DistributorAddress searchDistributorAddress = null;
            try
            {
                DistributorAddressDAL distributorAddressDAL = new DistributorAddressDAL();
                searchDistributorAddress = distributorAddressDAL.SearchDistributorAddressDAL(searchDistributorAddressID);
            }
            catch (InventoryException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return searchDistributorAddress;

        }

        //Updating Distributor Address
        public static bool UpdateDistributorAddressBL(DistributorAddress updateDistributorAddress)
        {
            bool distributorAddressUpdated = false;
            try
            {
                if (ValidateDistributorAddress(updateDistributorAddress))
                {
                    DistributorAddressDAL distributorAddressDAL = new DistributorAddressDAL();
                    distributorAddressUpdated = distributorAddressDAL.UpdateDistributorAddressDAL(updateDistributorAddress);
                }
            }
            catch (InventoryException)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return distributorAddressUpdated;
        }

        //Deleting Distributor Address
        public static bool DeleteDistributorAddressBL(int deleteDistributorAddressID)
        {
            bool distributorAddressDeleted = false;
            try
            {
                if (deleteDistributorAddressID > 0)
                {
                    DistributorAddressDAL distributorAddressDAL = new DistributorAddressDAL();
                    distributorAddressDeleted = distributorAddressDAL.DeleteDistributorAddressDAL(deleteDistributorAddressID);
                }
                else
                {
                    throw new InventoryException("Invalid Distributor ID");
                }
            }
            catch (InventoryException)
            {
                throw;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return distributorAddressDeleted;
        }
    }
}
