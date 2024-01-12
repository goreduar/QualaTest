using System;
using System.Collections.Generic;

namespace Quala.Core.Entities;

public partial class QualaOffice
{
    public int Code { get; set; }

    public string Description { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string Identification { get; set; } = null!;

    public DateTime? CreationDate { get; set; }

    public int? Money { get; set; }

}
