using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IBookingService
    {
        public ResponseModel<List<BookingModel>> GetAll();
        public ResponseModel<Booking> CreateBooking(BookingRequestModel signUpModel);
        public ResponseModel<BookingModel> GetSingle(string id);
        public ResponseModel<List<BookingModel>> GetByMemberID(string id);
        public ResponseModel UpdateStatus(String id, BookingStatus status);

    }
}
