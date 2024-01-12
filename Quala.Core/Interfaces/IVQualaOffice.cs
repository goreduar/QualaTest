using Quala.Core.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quala.Core.Interfaces
{
    public interface IVQualaOffice
    {
        Task<List<VQualaOfficeDTO>> GetQualaOffice();
        Task InsertOffice(VQualaOfficeDTO flycitie);
        Task UpdateOffice(VQualaOfficeDTO flycitie);
        Task DeleteOffice(int id);
    }
}
