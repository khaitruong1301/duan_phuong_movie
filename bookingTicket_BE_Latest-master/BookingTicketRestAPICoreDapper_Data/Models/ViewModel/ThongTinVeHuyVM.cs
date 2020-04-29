using System.Collections.Generic;

namespace BookingTicketRestAPICoreDapper_Data.Models.ViewModel
{
    public class DanhSachVeHuyVM
    {
        //public int MaThanhToan { get; set; }
        public decimal MucHoanTra { get; set; }
        public ICollection<VeHuyViewModel> DanhSachVeHuy { get; set; }

        public class VeHuyViewModel
        {
            public int MaVe { get; set; }
            public decimal GiaVe { get; set; }
        }
    }
}