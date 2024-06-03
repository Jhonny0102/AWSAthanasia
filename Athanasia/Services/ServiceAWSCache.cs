using Amazon.Runtime.Internal.Util;
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

        public async Task<List<ProductoSimpleView>> GetLibrosFavoritosAsync()
        {

            string jsonLibros =
                await this.cache.GetStringAsync("librosfavoritos");
            if (jsonLibros == null)
            {
                return null;
            }
            else
            {
                List<ProductoSimpleView> cars = JsonConvert.DeserializeObject<List<ProductoSimpleView>>(jsonLibros);
                return cars;
            }
        }

        public async Task AddLibroFavoritoAsync(ProductoSimpleView libro)
        {
            List<ProductoSimpleView> libros = await this.GetLibrosFavoritosAsync();

            if (libros == null)
            {
                libros = new List<ProductoSimpleView>();
            }

            libros.Add(libro);

            string jsonLibros = JsonConvert.SerializeObject(libros);
            DistributedCacheEntryOptions options =
                new DistributedCacheEntryOptions
                {
                    SlidingExpiration = TimeSpan.FromMinutes(30)
                };

            await this.cache.SetStringAsync("librosfavoritos"
                , jsonLibros, options);
        }

        public async Task DeleteCocheFavoritoAsync(int idlibro)
        {
            List<ProductoSimpleView> libros = await this.GetLibrosFavoritosAsync();
            if (libros != null)
            {
                ProductoSimpleView libroEliminar = libros.FirstOrDefault(x => x.IdLibro == idlibro);
                libros.Remove(libroEliminar);
                if (libros.Count == 0)
                {
                    await this.cache.RemoveAsync("librosfavoritos");
                }
                else
                {
                    string jsonLibros = JsonConvert.SerializeObject(libros);
                    DistributedCacheEntryOptions options =
                        new DistributedCacheEntryOptions
                        {
                            SlidingExpiration = TimeSpan.FromMinutes(30)
                        };
                    await this.cache.SetStringAsync("librosfavoritos", jsonLibros, options);
                }

            }

        }
    }
}
