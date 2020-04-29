using System.Collections.Generic;

namespace BookingTicketRestAPICoreDapper_Data.Models
{
    public class Ghe
    {
        public int MaGhe { get; set; }
        public string TenHang { get; set; }

        public string TenGhe { get; set; }

        public int MaRap { get; set; }

        public int SoThuTu { get; set; }

        public int MaLoaiGhe { get; set; }

        public bool KichHoat { get; set; }
    }

    public class GheInsert
    {
        public int MaRap { get; set; }
        public IEnumerable<ObjectGheInsert> DanhSachGhe { get; set; }
    }

    public class ObjectGheInsert
    {
        public string TenHang { get; set; }
        public int SoLuongGhe { get; set; }
    }


    public class GheUpdateLoai
    {
        public int MaRap { get; set; }
        public string TenLoaiGhe { get; set; }
        public IEnumerable<ObjectGheUpdate> DanhSachGheUpdate { get; set; }
    }

    public class ObjectGheUpdate
    {
        public int MaGhe { get; set; }
    }



}