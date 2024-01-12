using System;
using System.Collections.Generic;

namespace Quala.Core.DTOs;

public class VQualaOfficeDTO
{
    public int Code { get; set; }

    public string OfficeDescription { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string Identification { get; set; } = null!;

    public DateTime? CreationDate { get; set; }

    public int Id { get; set; }

    public string TypeMoney { get; set; } = null!;

    public string? MoneyDescription { get; set; }
}
