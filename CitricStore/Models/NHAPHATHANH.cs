//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CitricStore.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class NHAPHATHANH
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NHAPHATHANH()
        {
            this.UNGDUNGs = new HashSet<UNGDUNG>();
        }
    
        public int MaNPH { get; set; }
        public string TenNPH { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UNGDUNG> UNGDUNGs { get; set; }
    }
}