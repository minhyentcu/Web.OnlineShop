using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class ContactService : IContactService
    {
        private readonly OnlineShopDbContext _context;
        public ContactService(OnlineShopDbContext context)
        {
            _context = context;
        }
        public IEnumerable<Contact> Contacts(bool status = true)
        {
            if (status)
            {
                return _context.Contacts.Where(x => x.Status == true);
            }
            return _context.Contacts;
        }


        public async Task<bool> Create(Contact contact)
        {
            try
            {
                _context.Contacts.Add(contact);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> Delete(long id)
        {
            try
            {
                var contact = await _context.Contacts.FindAsync(id);
                if (contact != null)
                {
                    _context.Contacts.Remove(contact);
                    await _context.SaveChangesAsync();
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                return false;
            }
        }

        public Contact GetContactById(long? id)
        {
            try
            {
                if (id == null)
                {
                    return _context.Contacts.FirstOrDefault();
                }
                return _context.Contacts.Find(id);
            }
            catch (Exception)
            {
                return null;
            }

        }

        public async Task<bool> Update(Contact entity)
        {
            try
            {
                var contact = await _context.Contacts.FindAsync(entity.Id);
                if (contact != null)
                {
                    contact.Email = entity.Email;
                    contact.Phone = entity.Phone;
                    contact.PhoneSecond = entity.PhoneSecond;
                    contact.Address = entity.Address;
                    contact.Status = entity.Status;
                    await _context.SaveChangesAsync();
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
