using AutoMapper;
using System.Runtime.CompilerServices;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Globals;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Repository
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
           CreateMap<Account,AccountModel>().ReverseMap(); 
           CreateMap<AccountModel,AdminAccount>().ReverseMap(); 
           CreateMap<Account,AccountRequestModel>().ReverseMap(); 
           CreateMap<Account,Accountsta>().ReverseMap(); 
           CreateMap<Realestate,RealestateModel>().ReverseMap(); 
           CreateMap<Realestate,RealestateRequestModel>().ReverseMap(); 
           CreateMap<Timeshare,TimeshareModel>().ReverseMap(); 
           CreateMap<Feedback,FeedbackModel>().ReverseMap();
           CreateMap<Booking,BookingModel>().ReverseMap();
        }

    }
}
