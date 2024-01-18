using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Repository.UOW;

namespace TimeshareExchangeAPI.Repository.Repository.Implement
{
    public class AccountRepository : GenericRepository<Account>, IAccountRepository
    {
        public AccountRepository(TimeshareExchangeContext context, IUnitOfWork unitOfWork) : base(context, unitOfWork)
        {
        }

    }
}
