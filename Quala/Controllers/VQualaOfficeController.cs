using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Quala.Core.DTOs;
using Quala.Core.Interfaces;

namespace Quala.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VQualaOfficeController : ControllerBase
    {
        private readonly IVQualaOffice _iVQualaOffice;
        private readonly IMapper _mapper;

        public VQualaOfficeController(IVQualaOffice vQualaOffice, IMapper mapper)
        {
            _iVQualaOffice = vQualaOffice;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<List<VQualaOfficeDTO>> GetListOffice()
        {
            var listOffice = await _iVQualaOffice.GetQualaOffice();

            var VOffice = _mapper.Map<List<VQualaOfficeDTO>>(listOffice);

            return VOffice;
        }


        [HttpPost]
        public async Task<ActionResult<VQualaOfficeDTO>> InsertOffice(VQualaOfficeDTO vQualaOffice)
        {
           await _iVQualaOffice.InsertOffice(vQualaOffice);

            return CreatedAtAction(nameof(GetListOffice), 0);
        }

        [HttpPut]
        public async Task<ActionResult<VQualaOfficeDTO>> UpdateOffice(VQualaOfficeDTO vQualaOffice)
        {
            await _iVQualaOffice.UpdateOffice(vQualaOffice);

            return CreatedAtAction(nameof(GetListOffice), 0);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<VQualaOfficeDTO>> DeleteOffice(int id)
        {
            await _iVQualaOffice.DeleteOffice(id);
            return CreatedAtAction(nameof(GetListOffice), 0);
        }
    }
}
