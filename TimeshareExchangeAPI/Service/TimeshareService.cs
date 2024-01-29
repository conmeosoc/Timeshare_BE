using AutoMapper;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{
    public class TimeshareService : ITimeshareService
    {
        private readonly IGenericRepository<Timeshare> _timeshareRepository;
        private readonly IMapper _mapper;

        public TimeshareService(IGenericRepository<Timeshare> repositoryBase, IMapper mapper)
        {
            _timeshareRepository = repositoryBase;
            _mapper = mapper;

        }



        //Get ALL
        public ResponseModel<List<TimeshareModel>> GetAll()
        {
            var entities = _timeshareRepository.GetAll().ToList();
            var response = _mapper.Map<List<TimeshareModel>>(entities.ToList());
            return new ResponseModel<List<TimeshareModel>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel<IQueryable<Timeshare>> GetTimeshareByRealestate(string? name)
        {
            var response = _timeshareRepository.Get(x => x.RealestateId == name);
            return new ResponseModel<IQueryable<Timeshare>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        //GetID
        public ResponseModel<Timeshare> GetSingle(string id)
        {
            var AccountEntity = _timeshareRepository.GetSingle(x => x.Id.Equals(id));
            var responseAccountModel = _mapper.Map<TimeshareModel>(AccountEntity);
            return new ResponseModel<Timeshare>
            {
                Data = AccountEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        //Update
        public ResponseModel UpdateTimeshare(string id, TimeshareModel requestTimeshareModel)
        {
            var Timeshare = _timeshareRepository.GetSingle(x => id.Equals(x.Id));
            if (Timeshare == null)
            {
                return new ResponseModel
                {
                    MessageError = "Khong tim thay",
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            _mapper.Map(requestTimeshareModel, Timeshare);
            _timeshareRepository.Update(Timeshare);
            return new ResponseModel
            {
                StatusCode = StatusCodes.Status200OK
            };
        }



    }
}
