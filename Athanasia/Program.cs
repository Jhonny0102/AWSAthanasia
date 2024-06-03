using Athanasia.Data;
using Athanasia.Helpers;
using Athanasia.Models.Util;
using Athanasia.Repositories;
using Athanasia.Services;
using Azure.Security.KeyVault.Secrets;
using Azure.Storage.Blobs;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Azure;
using Newtonsoft.Json;

var builder = WebApplication.CreateBuilder(args);
//
string jsonSecrets = await 

    HelperSecretManager.GetSecretsAsync(); 

KeysModel keysModel =  

    JsonConvert.DeserializeObject<KeysModel>(jsonSecrets); 

builder.Services.AddSingleton<KeysModel>(x => keysModel); 
//
builder.Services.AddAntiforgery();
builder.Services.AddHttpContextAccessor();
builder.Services.AddAuthentication(options =>
{
    options.DefaultSignInScheme =
    CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultAuthenticateScheme =
    CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme =
    CookieAuthenticationDefaults.AuthenticationScheme;
}).AddCookie(
    CookieAuthenticationDefaults.AuthenticationScheme,
    config => config.AccessDeniedPath = "/Managed/ErrorAcceso");
builder.Services.AddControllersWithViews
    (options => options.EnableEndpointRouting = false)
    .AddSessionStateTempDataProvider();
builder.Services.AddMemoryCache();
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession();


builder.Services.AddAzureClients(factory =>
{
    factory.AddSecretClient(builder.Configuration.GetSection("KeyVault"));
});
SecretClient secretClient = builder.Services.BuildServiceProvider().GetService<SecretClient>();
KeyVaultSecret storagekey = await secretClient.GetSecretAsync("StorageAccount");
BlobServiceClient blobServiceClient = new BlobServiceClient(storagekey.Value);
builder.Services.AddTransient<BlobServiceClient>(x => blobServiceClient);
builder.Services.AddTransient<ServiceStorageBlobs>();

builder.Services.AddTransient<ServiceCacheRedis>();

builder.Services.AddTransient<ServiceAWSCache>();
builder.Services.AddStackExchangeRedisCache(options =>
{
    options.Configuration = "cache-proyecto-aws.uk9dp8.ng.0001.use1.cache.amazonaws.com:6379";
    options.InstanceName = "ElastiCacheExample";
    options.ConfigurationOptions = new StackExchange.Redis.ConfigurationOptions
    {
        EndPoints = { "cache-proyecto-aws.uk9dp8.ng.0001.use1.cache.amazonaws.com:6379" },
        AbortOnConnectFail = false
    };
});
//
builder.Services.AddTransient<HelperPathProvider>();
builder.Services.AddTransient<HelperMails>();
builder.Services.AddAutoMapper(typeof(MappingProfile));
builder.Services.AddTransient<IRepositoryAthanasia, ServiceAthanasia>();
string connectionString = builder.Configuration.GetConnectionString("SqlServerAzure");
builder.Services.AddDbContext<AthanasiaContext>(
    options => options.UseSqlServer(connectionString)
    );
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();
app.UseSession();

app.UseMvc(routes =>
{
    routes.MapRoute(
        name: "default",
        template: "{controller=Libro}/{action=Index}/{id?}");
});

app.Run();
