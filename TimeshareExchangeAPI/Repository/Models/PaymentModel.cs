using System.ComponentModel.DataAnnotations.Schema;

namespace TimeshareExchangeAPI.Repository.Models
{

        [Table("UserPaymentMenthod")]
        public class PaymentModel
        {
            public string name { get; set; }
        }
    
}
