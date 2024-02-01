using Curso_UDemyWebApi;
using Curso_UDemyWebApi.Servicios;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;


var builder = WebApplication.CreateBuilder(args);
IConfiguration Configuration;
var config = builder.Configuration;
var cadenaConexionSql = new ConexionBaseDatos(config.GetConnectionString("SQL"));
builder.Services.AddSingleton(cadenaConexionSql);
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters()
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = config["JWT:Issuer"],
        ValidAudience = config["JWT:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(
        Encoding.UTF8.GetBytes(config["JWT:ClaveSecreta"]))
    };
});

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddAuthorization();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
//metodo para que me deja agregar cabecera(JWT) esta completo en eñ curso que es para que me auterice si puedo o no utilizar los get/post
builder.Services.AddSwaggerGen();

//aca inyecto la dependencia
builder.Services.AddScoped<IServicioEjemplo, ClassServicioEjemplo>(); //de esta manera tenemos la aplicacion
//preparada para agregar este servicio en cualquiera de nuestras clases
//builder.Services.AddSingleton<IServicioEmpleado, ServicioEmpleado>(); //es para guardar en memoria
//antes lo defini como un AddScoped pero como no trabajo con base de datos no me guardaba los empleados creados nuevos
builder.Services.AddSingleton<IServicioEmpleadoSQL, ServicioEmpleadoSQL>();
builder.Services.AddSingleton<IServicioUsuarioAPI, ServicioUsuarioAPI>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
