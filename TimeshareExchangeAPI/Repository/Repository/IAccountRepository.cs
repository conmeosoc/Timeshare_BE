using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;

namespace TimeshareExchangeAPI.Repository.Repository
{
    public interface IAccountRepository : IGenericRepository<Account>
    {

    }
    public class AccountRepository : GenericRepository<Account> , IAccountRepository
    {

    }
}
