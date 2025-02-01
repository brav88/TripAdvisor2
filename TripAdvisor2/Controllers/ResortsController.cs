using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using TripAdvisor2.Model;

namespace TripAdvisor2.Controllers
{
    public class ResortsController
    {        
        public List<Resort> GetResorts()
        {            
            List<Resort> resorts = new List<Resort>();

            resorts.Add(new Resort()
            {
                Id = 1,
                Name = "Pagagayo Resort Guanacaste",
                Description = "Welcome to our best resort in CR",
                Price = 199,
                Photo = "https://allegro-papagayo.hotelsguanacaste.com/data/Images/OriginalPhoto/2497/249778/249778253/image-papagayo-bay-allegro-papagayo-hotel-18.JPEG"
            });

            resorts.Add(new Resort()
            {
                Id = 2,
                Name = "Riu Palace Resort Guanacaste",
                Description = "Welcome to our best resort in CR",
                Price = 399,
                Photo = "https://media-cdn.tripadvisor.com/media/photo-s/22/15/f3/4e/hotel-riu-guanacaste.jpg"
            });

            resorts.Add(new Resort()
            {
                Id = 3,
                Name = "Hilton Resort Nicoya Guanacaste",
                Description = "Welcome to our best resort in CR",
                Price = 299,
                Photo = "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2d/e6/0b/35/exterior.jpg?w=700&h=-1&s=1"
            });

            return resorts;
        }

        
    }
}