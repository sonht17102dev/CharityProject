package com.sonhtFX17102.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sonhtFX17102.DTO.PartnerDTO;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.mapper.MapperCircum;
import com.sonhtFX17102.mapper.MapperPartner;
import com.sonhtFX17102.mapper.MapperPartnerDTO;

@Repository
public class PartnerDAO extends BaseDao{
	
	public List<PartnerDTO> getAllPartners(){
		String sql = "select partner_id, partner_logo, partner_name, partner_slogan from partner";
		List<PartnerDTO> list = _jdbcTemplate.query(sql, new MapperPartnerDTO());
		return list;
	}
	
	public Partner getPartnerById(int id) {
		String sql = "select * from partner where partner_id = " + id;
		List<Partner> list = _jdbcTemplate.query(sql, new MapperPartner());
		return list.get(0);
	}
	
	/*
	 * method getCountAllPartner trả về tổng số items của bảng partner
	 */
	public int getCountAllPartner() {
		String sql = "select * from partner where partner_status = 'active';";
		List<Partner> list = _jdbcTemplate.query(sql, new MapperPartner());
		return list.size();
	}
	/*
	 * method getPagingPage trả về items của bảng partner
	 * thực hiện phân trang dữ liệu
	 * mỗi lần chỉ lấy 5 item trong db để hiển thị phân trang
	 */
	public List<Partner> getPagingPage(int index) {
		index = (index - 1) * 5;
		String sql = "select * from partner "
				+ " where partner_status = 'active'"
				+ " order by partner_id " + "OFFSET " + index
				+ " ROWS FETCH NEXT 5 ROWS ONLY";

		List<Partner> list = _jdbcTemplate.query(sql, new MapperPartner());
		return list;
	}
	
	public List<Partner> getTop6Partner() {
		String sql = "select top 6 * from partner\r\n"
				+ " where partner_status='active' "
				+ " order by partner_id;";
		List<Partner> list = _jdbcTemplate.query(sql, new MapperPartner());
		return list;
	}
	public List<Partner> getPartnersByKey(String key) {
		String sql = "select * from partner\r\n"
				+ " where partner_name like N'%"+ key +"%' and partner_status='active';";
		List<Partner> list = _jdbcTemplate.query(sql, new MapperPartner());
		return list;
	}
	public List<Partner> getPartnerByMoney() {
		String sql = "select * from partner\r\n"
				+ " where partner_total_money > 2000 and partner_status='active';";
		List<Partner> list = _jdbcTemplate.query(sql, new MapperPartner());
		return list;
	}
	public List<Partner> getPartnerByProject() {
		String sql = "select * from partner\r\n"
				+ " where partner_number_donate > 30 and partner_status='active';";
		List<Partner> list = _jdbcTemplate.query(sql, new MapperPartner());
		return list;
	}
	
	/*
	 * method deletePartnerById thay đổi trường partner_status từ active-> inactive
	 */
	public void deletePartnerById(int id) {
		String sql = "update partner "
				+ " set partner_status = 'inactive'"
				+ " where partner_id = " + id +";";
		_jdbcTemplate.update(sql);
	}
	/*
	 * method checkPartnerByNameExist tìm kiếm partner 
	 * để kiểm tra việc thêm partner có trùng tên không
	 */
	public Partner checkPartnerByNameExist(String name) {
		String sql = "select * from partner where partner_name = '" + name + "' ; ";
		List<Partner> partners =  _jdbcTemplate.query(sql, new MapperPartner());
		if (partners.size()==0) return null;
		else return partners.get(0);
	}
	
	public void insertPartner(String partner_name, String partner_slogan, String partner_logo, String partner_banner,
			int partner_number_donate, int partner_total_money, String partner_introduce,
			String partner_content, String partner_status) {
		String sql = "INSERT INTO PARTNER("
				+ "    partner_name, partner_slogan, partner_logo,"
				+ "	partner_banner, partner_introduce, partner_number_donate,"
				+ " partner_total_money, partner_content, partner_status "
				+ " ) values ( "
				+ " N'" + partner_name + "', "
				+ " N'" + partner_slogan + "', "
				+ " N'" + partner_logo + "', "
				+ " N'" + partner_banner + "', "
				+ partner_number_donate + ", "
				+ partner_total_money + ", "
				+ " N'" + partner_introduce + "', "
				+ " N'" + partner_content + "', "
				+ " '" + partner_status + "' "
				+ ")";
		_jdbcTemplate.update(sql);
	}
	
	public void updatePartnerById(int partner_id, String partner_name, String partner_slogan, String partner_logo,
			String partner_banner, int partner_number_donate, int partner_total_money, String partner_introduce,
			String partner_content, String partner_status) {
		String sql = "Update PARTNER set "
				+ " partner_name = N'" + partner_name + "', "
				+ " partner_slogan = N'" + partner_slogan + "', "
				+ " partner_logo = N'" + partner_logo + "', "
				+ " partner_banner = N'" + partner_banner + "', "
				+ " partner_number_donate = " + partner_number_donate + ", "
				+ " partner_total_money = " + partner_total_money + ", "
				+ " partner_introduce = N'" + partner_introduce + "', "
				+ " partner_content = N'" + partner_content + "', "
				+ " partner_status = N'" + partner_status + "' "
				+ " where partner_id = " + partner_id + " ;" ;
		_jdbcTemplate.update(sql);
	}
	public List<Partner> findPartnersInactive(String status) {
		String sql = "Select * from partner where partner_status = 'inactive'";
		List<Partner> list = _jdbcTemplate.query(sql, new MapperPartner());
		return list;
	}
}
