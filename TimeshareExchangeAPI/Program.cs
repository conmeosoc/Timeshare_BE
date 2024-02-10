using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;
using System.Text.Json.Serialization;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Globals;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Service;
using TimeshareExchangeAPI.Service.IService;


//reading config
GlobalFuns.ReadConfigSetting();
//
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddDirectoryBrowser();

builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo
    {
        Version = "v1",
        Title = "TimeshareAPI",
        Description = "An ASP.NET Core Web API .NET 6",
    });

    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Name = "Authorization",
        Description = "Bearer Authentication with JWT Token",
        Type = SecuritySchemeType.Http
    });
    options.AddSecurityRequirement(new OpenApiSecurityRequirement {
        {
            new OpenApiSecurityScheme {
                Reference = new OpenApiReference {
                    Id = "Bearer",
                        Type = ReferenceType.SecurityScheme
                }
            },
            new List < string > ()
        }
    });
});
builder.Services.AddControllers().AddJsonOptions(x =>
                x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);

builder.Services.AddCors(opts =>
{
    opts.AddPolicy("corspolicy", build =>
    {
        build.WithOrigins("*").AllowAnyMethod().AllowAnyHeader();
    });
});
builder.Services.AddDbContext<TimeshareExchangeContext>(options =>
           options.UseSqlServer(builder.Configuration.GetConnectionString("TimeshareExchange")));
builder.Services.AddAutoMapper(typeof(Program));
//jwt
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    RequireAudience = false,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ClockSkew = TimeSpan.Zero,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes("eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJ0aGFvbmhtIiwiVXNlcm5hbWUiOiJKYXZhSW5Vc2UiLCJleHAiOjE3MDY1MTMyNzMsImlhdCI6MTcwNjUxMzI3M30.YWO4zbj19dDtiECHpJMXscZJJipmeKBlZjzCystgr_4\r\n"))
                };
            });


//Repository
builder.Services.AddScoped<IGenericRepository<Account>, GenericRepository<Account>>();
builder.Services.AddScoped<IGenericRepository<Timeshare>, GenericRepository<Timeshare>>();
builder.Services.AddScoped<IGenericRepository<Realestate>, GenericRepository<Realestate>>();
builder.Services.AddScoped<IGenericRepository<Feedback>, GenericRepository<Feedback>>();
builder.Services.AddScoped<IGenericRepository<Booking>, GenericRepository<Booking>>();

//Service
builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<ITimeshareService, TimeshareService>();
builder.Services.AddScoped<IRealestateService, RealestateService>();
builder.Services.AddScoped<IFeedbackService, FeedbackService>();
builder.Services.AddScoped<IBookingService, BookingService>();
builder.Services.AddScoped<IVoucherService, VoucherService>();


var app = builder.Build();



// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())

    app.UseSwagger();
    app.UseSwaggerUI();

app.UseCors("corspolicy");

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.Run();


