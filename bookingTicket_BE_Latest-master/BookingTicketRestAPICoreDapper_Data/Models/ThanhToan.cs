using System;
using System.Collections.Generic;
using System.Text;

namespace BookingTicketRestAPICoreDapper_Data.Models
{
    public class ThanhToan
    {
        public int MaThanhToan { get; set; }
        public int MaThanhVien { get; set; }
        public decimal TongTien { get; set; }
        public DateTime NgayDat { get; set; }
        public int MucHoanTien { get; set; }
        public int GiamGia { get; set; }
        public int TrangThaiThanhToan { get; set; }
        public int TrangThaiHuy { get; set; }
        public string GhiChu { get; set; }
    }
}
