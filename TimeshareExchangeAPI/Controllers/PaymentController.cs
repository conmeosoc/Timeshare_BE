using Microsoft.AspNetCore.Mvc;
using PayPalCheckoutSdk.Core;
using PayPalCheckoutSdk.Orders;
using PayPalHttp;
using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Threading.Tasks;

namespace TimeshareExchangeAPI.Controllers

{
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentController : ControllerBase
    {
        private readonly string _payPalClientId = "sb-9s5gi29726274@personal.example.com";
        private readonly string _payPalClientSecret = "YOUR_CLIENT_SECRET";

        [HttpPost]
        [Route("createOrder")]
        public async Task<IActionResult> CreateOrder()
        {
            try
            {
                var environment = new SandboxEnvironment(_payPalClientId, _payPalClientSecret);
                var client = new PayPalHttpClient(environment);

                var request = new OrdersCreateRequest();
                request.Prefer("return=representation");
                request.RequestBody(BuildRequestBody());

                var response = await client.Execute(request);
                var statusCode = response.StatusCode;
                var result = response.Result<Order>();

                return Ok(new { orderId = result.Id });
            }
            catch (HttpException ex)
            {
                return StatusCode((int)ex.StatusCode, ex.Message);
            }
        }

        private OrderRequest BuildRequestBody()
        {
            return new OrderRequest
            {
                CheckoutPaymentIntent = "CAPTURE",
                ApplicationContext = new ApplicationContext
                {
                    BrandName = "EXAMPLE INC",
                    LandingPage = "BILLING",
                    UserAction = "CONTINUE",
                    ShippingPreference = "SET_PROVIDED_ADDRESS"
                },
                PurchaseUnits = new List<PurchaseUnitRequest>
                {
                    new PurchaseUnitRequest
                    {
                        AmountWithBreakdown = new AmountWithBreakdown
                        {
                            CurrencyCode = "USD",
                            Value = "100.00"
                        }
                    }
                }
            };
        }
    }
}
