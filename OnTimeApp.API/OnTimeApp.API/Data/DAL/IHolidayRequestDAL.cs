using System.Threading.Tasks;

namespace OnTimeApp.API.Entities.DAL
{
    public interface IHolidayRequestDAL
    {
        Task<bool> AddRequestAsync(HolidayRequest request);
    }
}