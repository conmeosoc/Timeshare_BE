using Microsoft.EntityFrameworkCore;
using System.Text.Json.Serialization;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Service;
using TimeshareExchangeAPI.Service.IService;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddDirectoryBrowser();

builder.Services.AddSwaggerGen();
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

//Repository
builder.Services.AddScoped<IGenericRepository<Account>, GenericRepository<Account>>();
builder.Services.AddScoped<IGenericRepository<Timeshare>, GenericRepository<Timeshare>>();
builder.Services.AddScoped<IGenericRepository<Realestate>, GenericRepository<Realestate>>();

//Service
builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<ITimeshareService, TimeshareService>();
builder.Services.AddScoped<IRealestateService, RealestateService>();


var app = builder.Build();



// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())

    app.UseSwagger();
    app.UseSwaggerUI();


app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
app.UseCors("corspolicy");

