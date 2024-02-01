
using Curso_UDemyWebApi.Modelo;

namespace Curso_UDemyWebApi.Servicios
{
    public class ServicioEmpleado : IServicioEmpleado
    {

        public readonly List<Empleado> listaEmpleados = new()
        {
            new Empleado{Id= 1, Nombre="Rocio", CodEmpleado="A001", Email= "mail@mail.com", Edad= 22, FechaAlta=DateTime.Now,FechaBaja=null},
            new Empleado{Id= 2, Nombre="Pedro", CodEmpleado="A002", Email= "mail2@mail.com", Edad= 54, FechaAlta=DateTime.Now,FechaBaja=null},
            new Empleado{Id= 3, Nombre="Manolo", CodEmpleado="A003", Email= "mail3@mail.com", Edad= 19, FechaAlta=DateTime.Now, FechaBaja = null},
            new Empleado{Id= 4, Nombre="Ana", CodEmpleado="A004", Email= "mail4@mail.com", Edad= 23, FechaAlta=DateTime.Now, FechaBaja = null}
        };

        
        public IEnumerable<Empleado> DameEmpleados()
        {
            return listaEmpleados;
        }

        public Empleado DameEmpleado(string codEmpleado)
        {
            return listaEmpleados.Where(e => e.CodEmpleado == codEmpleado).SingleOrDefault();
        }

        public void NuevoEmpleado(Empleado e)
        {
           listaEmpleados.Add(e);
        }

        public void ModificarEmpleado(Empleado e)
        {
            //como estamos utilizando lista en memoria lo hacemos de esta forma, todavia no estamos usando base de datos
            int posicion = listaEmpleados.FindIndex(existeEmpleado => existeEmpleado.Id == e.Id);
            if(posicion != -1) 
            {
                listaEmpleados[posicion] = e;
            }
        }

        public void BajaEmpleado(string codEmpleado)
        {
            int posicion = listaEmpleados.FindIndex(existeEmpleado => existeEmpleado.CodEmpleado == codEmpleado);
            if (posicion != -1)
            {
                listaEmpleados.RemoveAt(posicion);
            }

        }
    }
}
