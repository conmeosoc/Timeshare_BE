using AutoMapper;
using System.Runtime.CompilerServices;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Repository
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
           CreateMap<Account,AccountModel>().ReverseMap(); 
           CreateMap<Account,AccountRequestModel>().ReverseMap(); 
           CreateMap<Account,Accountsta>().ReverseMap(); 
           CreateMap<Realestate,RealestateModel>().ReverseMap(); 
           CreateMap<Timeshare,TimeshareModel>().ReverseMap(); 
        }

    }
}
