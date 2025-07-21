package vn.devpro.javawebProject31.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.devpro.javawebProject31.model.Category;
import vn.devpro.javawebProject31.model.SaleValue;

@Service
public class SaleValueService extends BaseService<SaleValue> {

	@Override
	public Class<SaleValue> clazz() {
		// TODO Auto-generated method stub
		return SaleValue.class;
	}
	
	public List<SaleValue> findAllActive() {
		String sql = "SELECT * FROM tbl_sale_value";
		return super.executeNativeSql(sql);
	}
	
	@Transactional
	public void deleteSaleValueById(int id) {
		super.deleteById(id);
	}
}
