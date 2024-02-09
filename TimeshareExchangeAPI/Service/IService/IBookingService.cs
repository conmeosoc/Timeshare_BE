using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IBookingService
    {
        public ResponseModel<List<BookingModel>> GetAll();
        public ResponseModel<Booking> CreateBooking(BookingModel signUpModel);
        public ResponseModel<BookingModel> GetSingle(string id);

    }
}
