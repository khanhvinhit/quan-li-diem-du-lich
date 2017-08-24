namespace EntityModel.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Instruction")]
    public partial class Instruction
    {
        public long ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        public DateTime CreateDate { get; set; }

        public long AccountID { get; set; }

        public bool Status { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Detail { get; set; }

        [StringLength(250)]
        public string Images { get; set; }

		[Column(TypeName = "xml")]
		public string MoreImages { get; set; }

        public virtual Account Account { get; set; }
    }
}