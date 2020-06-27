using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
    public interface IContactService
    {
        IEnumerable<Contact> Contacts();
        Contact GetContactById(long? id);
        Task<bool> Create(Contact contact);
        Task<bool> Update(Contact contact);
        Task<bool> Delete(long id);
    }
}
