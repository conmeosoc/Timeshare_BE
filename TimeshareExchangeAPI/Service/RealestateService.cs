using AutoMapper;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Helper;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{
    public class RealestateService : IRealestateService
    {
        private readonly IGenericRepository<Realestate> _timeshareRepository;
        private readonly IMapper _mapper;

        public RealestateService(IGenericRepository<Realestate> repositoryBase, IMapper mapper)
        {
            _timeshareRepository = repositoryBase;
            _mapper = mapper;

        }

        public ResponseModel CreateRealestate(IWebHostEnvironment webHostEnvironment, RealestateRequestModel requestProductModel)
        {
            var entity = _mapper.Map<Realestate>(requestProductModel);
            if (entity == null)
            {
                return new ResponseModel
                {
                    MessageError = "Loi khong tao duoc san pham",
                    StatusCode = StatusCodes.Status400BadRequest
                };
            }
            entity.Id = Guid.NewGuid().ToString();
            var imagePath = ImageHandler.UploadImageToFile(webHostEnvironment, requestProductModel.imageFiles, entity.Id);
            entity.Photo = imagePath;
            entity.Status = "1";
            _timeshareRepository.Create(entity);
            return new ResponseModel
            {
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        //Get ALL
        public ResponseModel<List<RealestateModel>> GetAll()
        {
            var entities = _timeshareRepository.GetAll().ToList();
            var response = _mapper.Map<List<RealestateModel>>(entities.ToList());
            return new ResponseModel<List<RealestateModel>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel<IQueryable<Realestate>> GetRealestatebyname(string? name)
        {
            var response = _timeshareRepository.Get(x => x.Name == name);
            return new ResponseModel<IQueryable<Realestate>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        //GetID
        public ResponseModel<Realestate> GetSingle(string id)
        {
            var AccountEntity = _timeshareRepository.GetSingle(x => x.Id.Equals(id));
            var responseAccountModel = _mapper.Map<RealestateModel>(AccountEntity);
            return new ResponseModel<Realestate>
            {
                Data = AccountEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        //Update
        public ResponseModel UpdateRealestate(string id, RealestateRequestModel requestTimeshareModel)
        {
            var Realestate = _timeshareRepository.GetSingle(x => id.Equals(x.Id));
            if (Realestate == null)
            {
                return new ResponseModel
                {
                    MessageError = "Khong tim thay",
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            _mapper.Map(requestTimeshareModel, Realestate);
            _timeshareRepository.Update(Realestate);
            return new ResponseModel
            {
                StatusCode = StatusCodes.Status200OK
            };
        }
        //Update status
        public ResponseModel UpdateSta(String id, RealestateSta status)
        {
            var Voucher = _timeshareRepository.GetSingle(x => id.Equals(x.Id));
            if (Voucher == null)
            {
                return new ResponseModel<Realestate>
                {
                    MessageError = "Khong tim thay",
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            _mapper.Map(status, Voucher);
            Voucher.Id = id;
            _timeshareRepository.Update(Voucher);
            return new ResponseModel<Realestate>
            {
                Data = Voucher,
                StatusCode = StatusCodes.Status200OK
            };
        }




    }
}
