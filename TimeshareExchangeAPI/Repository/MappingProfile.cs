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
           CreateMap<Realestate,RealestateSta>().ReverseMap(); 
           CreateMap<Realestate,RealestateRequestModel>().ReverseMap(); 
           CreateMap<Timeshare,TimeshareModel>().ReverseMap(); 
           CreateMap<Feedback,FeedbackModel>().ReverseMap();
           CreateMap<Booking,BookingModel>().ReverseMap();
           CreateMap<Voucher,Vouchersta>().ReverseMap();
           CreateMap<Booking, BookingRequestModel>().ReverseMap();
           CreateMap<Timeshare, TimeshareRequestModel>().ReverseMap();
           CreateMap<Timeshare, Timesharesta>().ReverseMap();
           CreateMap<Exchange, ExchangeModel>().ReverseMap();
           CreateMap<Exchange, Exchangesta>().ReverseMap();
<<<<<<< HEAD
            CreateMap<Payment, PaymentModel>().ReverseMap();
            CreateMap<Payment, PaymentRequestModel>().ReverseMap();
            CreateMap<Payment, PaymentSta>().ReverseMap();
            CreateMap<Exchange, ExchangeRequestModel>().ReverseMap();
            CreateMap<Booking, BookingStatus>().ReverseMap();


=======
           CreateMap<Exchange, ExchangeRequestModel>().ReverseMap();
           CreateMap<Booking, BookingStatus>().ReverseMap();
>>>>>>> 36e231a20d36cba5a5a88f18f44c5c27dff00c33
        }

    }
}
