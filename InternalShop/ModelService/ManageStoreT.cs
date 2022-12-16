using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.Models
{
    public class ManageStoreT    /// Stores   MasterOFSToresID
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ManageStoreID { get; set; }
        [Required]
        [MaxLength(50)]
        public string? ManageStorename { get; set; }
        [Required]

        public DateTime DateAdd { get; set; }
        [Required]

        public int UserID { get; set; }

        public   ICollection<PermissionToEntertheStoreProductT>? PermissionToEntertheStoreProduct { get; set; }

     }
}
