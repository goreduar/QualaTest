using AutoMapper;
using Azure.Core;
using Microsoft.EntityFrameworkCore;
using Quala.Core.DTOs;
using Quala.Core.Interfaces;
using Quala.Infraestructure.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quala.Infraestructure.Repositories
{
    public class VQualaOfficeRepositories : IVQualaOffice
    {
        private readonly TestDbContext _testDbContext;
        private readonly IMapper _mapper;

        public VQualaOfficeRepositories(TestDbContext testDbContext, IMapper mapper) 
        {
            _testDbContext = testDbContext;
            _mapper = mapper;
        }
        async Task IVQualaOffice.DeleteOffice(int id)
        {
            await _testDbContext.Database.ExecuteSqlRawAsync("BD_QualaOffice {0}",
                                                                id
                                                            ); 
        }

        async Task<List<VQualaOfficeDTO>> IVQualaOffice.GetQualaOffice()
        {
            var listOffice = await _testDbContext.VQualaOffices.ToListAsync();

            var listOfficeDTO = _mapper.Map<List<VQualaOfficeDTO>>(listOffice);

            return listOfficeDTO;
        }

        async Task IVQualaOffice.InsertOffice(VQualaOfficeDTO officeDTO)
        {

            await _testDbContext.Database.ExecuteSqlRawAsync("BI_QualaOffice {0},{1},{2},{3}",
                                                                 officeDTO.OfficeDescription,
                                                                 officeDTO.Address,
                                                                 officeDTO.Identification,
                                                                 officeDTO.Id

            );

        }

        async Task IVQualaOffice.UpdateOffice(VQualaOfficeDTO officeDTO)
        {
            await _testDbContext.Database.ExecuteSqlRawAsync("BU_QualaOffice {0},{1},{2},{3},{4}",
                                                     officeDTO.Code,
                                                     officeDTO.OfficeDescription,
                                                     officeDTO.Address,
                                                     officeDTO.Identification,
                                                     officeDTO.Id
                                                     );
        }
    }
}
