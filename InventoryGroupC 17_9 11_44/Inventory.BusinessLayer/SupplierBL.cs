﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Inventory.Entities;
using Inventory.Exceptions;
using Inventory.DataAccessLayer;

namespace Inventory.BusinessLayer
{
    public class SupplierBL
    {
        private static bool ValidateSupplier(Supplier supplier)
        {
            StringBuilder sb = new StringBuilder();
            bool validSupplier = true;
            if (supplier.SupplierId == null)
            {
                validSupplier = false;
                sb.Append(Environment.NewLine + "Invalid Supplier ID");

            }
            if (supplier.SupplierName == string.Empty)
            {
                validSupplier = false;
                sb.Append(Environment.NewLine + "Supplier Name Required");

            }
            if (supplier.SupplierPhone.Length < 10)
            {
                validSupplier = false;
                sb.Append(Environment.NewLine + "Required 10 Digit Contact Number");
            }
            if (!(supplier.SupplierEmail.Contains("@")))
            {
                validSupplier = false;
                sb.Append(Environment.NewLine + "Invalid Supplier Email");
            }
            if (validSupplier == false)
                throw new Exception(sb.ToString());
            return validSupplier;
        }

        public static bool AddSupplierBL(Supplier newSupplier)
        {
            bool SupplierAdded = false;
            try
            {
                if (ValidateSupplier(newSupplier))
                {
                    SupplierDAL SupplierDAL = new SupplierDAL();
                    SupplierAdded = SupplierDAL.AddSupplierDAL(newSupplier);
                }
            }
            catch (Exception)
            {
                throw;
            }

            return SupplierAdded;
        }

        public static List<Supplier> GetAllSupplierBL()
        {
            List<Supplier> SupplierList = null;
            try
            {
                SupplierDAL supplierDAL = new SupplierDAL();
                SupplierList = supplierDAL.GetAllSupplierDAL();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return SupplierList;
        }

        public static Supplier SearchSupplierBL(int searchSupplierID)
        {
            Supplier searchSupplier = null;
            try
            {
                SupplierDAL guestDAL = new SupplierDAL();
                searchSupplier = guestDAL.SearchSupplierDAL(searchSupplierID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return searchSupplier;

        }

        public static bool UpdateSupplierBL(Supplier updateSupplier)
        {
            bool SupplierUpdated = false;
            try
            {
                if (ValidateSupplier(updateSupplier))
                {
                    SupplierDAL supplierDAL = new SupplierDAL();
                    SupplierUpdated = supplierDAL.UpdateSupplierDAL(updateSupplier);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return SupplierUpdated;
        }

        public static bool DeleteSupplierBL(string deleteSupplierID)
        {
            bool SupplierDeleted = false;
            try
            {
                if (deleteSupplierID == null)
                {
                    SupplierDAL supplierDAL = new SupplierDAL();
                    SupplierDeleted = supplierDAL.DeleteSupplierDAL(int.Parse(deleteSupplierID));
                }
                else
                {
                    throw new Exception("Invalid supplier ID");
                }
            }
            catch (Exception)
            {
                throw;
            }

            return SupplierDeleted;
        }

    }
}