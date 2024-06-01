using Athanasia.Models.Views;
using Microsoft.Extensions.Caching.Distributed;
using Newtonsoft.Json;

namespace Athanasia.Services
{
    public class ServiceAWSCache
    {
        private IDistributedCache cache;

        public ServiceAWSCache(IDistributedCache cache)
        {
            this.cache = cache;
        }

        public async Task<List<ProductoView>> GetLibrosFavoritosAsync()
        {
            //ALMACENAREMOS UNA COLECCION DE COCHES EN FORMATO JSON
            //LAS KEYS DEBEN SER UNICAS PARA CADA USER
            string jsonLibros =
                await this.cache.GetStringAsync("librosfavoritos");
            if (jsonLibros == null)
            {
                return null;
            }
            else
            {
                List<ProductoView> cars = JsonConvert.DeserializeObject<List<ProductoView>>(jsonLibros);
                return cars;
            }
        }

        public async Task AddLibroFavoritoAsync(ProductoView libro)
        {
            List<ProductoView> libros = await this.GetLibrosFavoritosAsync();
            //SI NO EXISTEN COCHES FAVORITOS TODAVIA, CREAMOS 
            //LA COLECCION
            if (libros == null)
            {
                libros = new List<ProductoView>();
            }
            //AÑADIMOS EL NUEVO COCHE A LA COLECCION
            libros.Add(libro);
            //SERIALIZAMOS A JSON LA COLECCION
            string jsonLibros = JsonConvert.SerializeObject(libros);
            DistributedCacheEntryOptions options =
                new DistributedCacheEntryOptions
                {
                    SlidingExpiration = TimeSpan.FromMinutes(30)
                };
            //ALMACENAMOS LA COLECCION DENTRO DE CACHE REDIS
            //INDICAREMOS QUE LOS DATOS DURARAN 30 MINUTOS
            await this.cache.SetStringAsync("librosfavoritos"
                , jsonLibros, options);
        }
    }
}
