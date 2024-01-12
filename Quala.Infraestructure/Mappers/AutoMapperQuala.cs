using AutoMapper;
using Quala.Core.DTOs;
using Quala.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quala.Infraestructure.Mappers
{
    public class AutoMapperQuala : Profile
    {
        public AutoMapperQuala() 
        {
            CreateMap<VQualaOffice, VQualaOfficeDTO>();
        }
    }
}
