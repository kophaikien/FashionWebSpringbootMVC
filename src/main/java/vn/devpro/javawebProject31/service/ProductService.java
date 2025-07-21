package vn.devpro.javawebProject31.service;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.javawebProject31.dto.Jw31Constants;
import vn.devpro.javawebProject31.dto.SearchCategoryDTO;
import vn.devpro.javawebProject31.dto.SearchModel;
import vn.devpro.javawebProject31.model.Product;
import vn.devpro.javawebProject31.model.ProductImage;
import vn.devpro.javawebProject31.model.SaleValue;
import vn.devpro.javawebProject31.model.Variant;

@Service
public class ProductService extends BaseService<Product> implements Jw31Constants {
	
	@Override
	public Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}
	
	public List<Product> findAllActive() {
		String sql = "SELECT * FROM tbl_product ";
		return super.executeNativeSql(sql);
	}
	
	//Kiem tra file co ton tai hay khong?
	public boolean isExistFile(MultipartFile file) {
		if (file != null && !StringUtils.isEmpty(file.getOriginalFilename())) {
			return true;
		}
		return false;
		
	}
	
	//Kiem tra file co ton tai hay khong?
		public boolean isExistFiles(MultipartFile[] files) {
			if (files != null && files.length > 0) {
				return true;
			}
			return false;
			
		}
	
	@Transactional
	public Product saveProduct(Product product, MultipartFile avatarFile,
			MultipartFile[] imageFiles) throws IOException {
		
		//Kiem tra xem co upload avatar khong?
		if (isExistFile(avatarFile)) {//co upload
			//Luu file vao thu muc Product/Avatar
			String path = FOLDER_UPLOAD + "Product/Avatar/" 
							+ avatarFile.getOriginalFilename();
			
			File file = new File(path);
			avatarFile.transferTo(file);
			
			//Luu duong dan vao DB
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		
		//Kiem tra xem co upload images khong?
		if (isExistFiles(imageFiles)) {//Co upload
			for (MultipartFile image : imageFiles) {
				if (isExistFile(image)) {
					//Luu file vao thu muc Product/Image
					String path = FOLDER_UPLOAD + "Product/Image/" 
							+ image.getOriginalFilename();
			
					File file = new File(path);
					image.transferTo(file);
					//Luu duong dan vao bang tbl_product_image
					ProductImage productImage = new ProductImage();
					productImage.setPath("Product/Image/" + image.getOriginalFilename());
					productImage.setTitle(image.getOriginalFilename());
					productImage.setCreateDate(new Date());					
					productImage.setProduct(product);
					product.addRelationalProductImage(productImage);
				}
			}
		}
		if (product.getPrice() == null) {
			product.setPrice(BigDecimal.ZERO);
		}
		if (product.getSalePrice() == null) {
			product.setSalePrice(BigDecimal.ZERO);
		}
		
		List<Variant> variants = product.getVariants(); 
		if (!(variants.isEmpty())) { 
			for (Variant variant : new ArrayList<Variant>(variants)) { 
				variant.setProduct(product);
				product.addRelationalVariant(variant);
			}
		}
		return saveOrUpdate(product);
	}
	
	@Transactional
	public Product saveEditProduct(Product product, MultipartFile avatarFile,
			MultipartFile[] imageFiles) throws IOException {
		
		//Kiem tra xem co upload avatar khong?
		if (isExistFile(avatarFile)) {//co upload
			
			//Kiem tra xem co avatar cu khong?
			if (product.getAvatar() != null && !StringUtils.isEmpty(product.getAvatar())) {
				//Co thi phai xoa avatar cu
				String path = FOLDER_UPLOAD + product.getAvatar();
				File file = new File(path);
				file.delete();
				
			}
			//Luu file moi
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
			String path = FOLDER_UPLOAD + "Product/Avatar/" 
					+ avatarFile.getOriginalFilename();
	
			File file = new File(path);
			avatarFile.transferTo(file);
			}
		else { 
			Product product_old = getById(product.getId()); 
			product.setAvatar(product_old.getAvartar());

		}
			//Kiem tra xem co upload images khong?
			if (isExistFiles(imageFiles)) {//Co upload
				for (MultipartFile image : imageFiles) {
					if (isExistFile(image)) {
						//Luu file vao thu muc Product/Image
						String path = FOLDER_UPLOAD + "Product/Image/" 
								+ image.getOriginalFilename();
				
						File file = new File(path);
						image.transferTo(file);
						//Luu duong dan vao bang tbl_product_image
						ProductImage productImage = new ProductImage();
						productImage.setPath("Product/Image/" + image.getOriginalFilename());
						productImage.setTitle(image.getOriginalFilename());
						productImage.setCreateDate(new Date());
						
						productImage.setProduct(product);
						product.addRelationalProductImage(productImage);
					}
				}
			}
			if (product.getPrice() == null) {
				product.setPrice(BigDecimal.ZERO);
			}
			if (product.getSalePrice() == null) {
				product.setSalePrice(BigDecimal.ZERO);
			}
			
			
		return saveOrUpdate(product);
	}
	
	@Transactional
	public void inactiveProduct(Product product) {
		super.saveOrUpdate(product);
	}
	
	public List<Product> search(SearchModel searchModel) {
		String sql = "SELECT * FROM tbl_product p WHERE 1=1";
		
//		//Tim theo status
//		if (searchModel.getStatus() != 2) {
//			sql += " AND p.status=" + searchModel.getStatus();
//		}
		
		//Tim theo catgory
		if (searchModel.getCategoryId() != 0) {
			sql += " AND p.category_id=" + searchModel.getCategoryId();
		}
		
		//Tim theo keyword
		String keyword = searchModel.getKeyword(); 
		if (keyword != null) {
			sql += " AND (LOWER(p.name) like '%" + keyword.toLowerCase() + "%'" +
					" OR LOWER(p.short_description) like '%" + keyword.toLowerCase() + "%')";
		}
		
		//Tim tu ngay den ngay
		String date1 = searchModel.getBeginDate();
		String date2 = searchModel.getEndDate();
		if (date1 != null && date2 != null) {
			sql += " AND p.create_date BETWEEN '" + date1 + "' AND '" + date2 + "'";
		}
		
		System.out.println(sql);
 		return super.executeNativeSql(sql);
	}
	public List<Product> searchSale(SearchModel searchModel) {
	    String sql = "SELECT * FROM tbl_product p WHERE p.sale_price > 0 AND p.sale_price < p.price";

	    // Lọc theo danh mục
	    if (searchModel.getCategoryId() != 0) {
	        sql += " AND p.category_id = " + searchModel.getCategoryId();
	    }

	    // Lọc theo từ khóa
	    String keyword = searchModel.getKeyword(); 
	    if (keyword != null && !keyword.trim().isEmpty()) {
	        keyword = keyword.toLowerCase();
	        sql += " AND (LOWER(p.name) LIKE '%" + keyword + "%'" +
	               " OR LOWER(p.short_description) LIKE '%" + keyword + "%')";
	    }

	    // Lọc theo ngày tạo (nếu có)
	    String date1 = searchModel.getBeginDate();
	    String date2 = searchModel.getEndDate();
	    if (date1 != null && date2 != null) {
	        sql += " AND p.create_date BETWEEN '" + date1 + "' AND '" + date2 + "'";
	    }

	    System.out.println("[SQL SALE] " + sql);
	    return super.executeNativeSql(sql);
	}

	public void applyDiscount(Product product) {
	    BigDecimal originalPrice = product.getPrice();

	    if (product.getSaleValue() != null && product.getSaleValue().getId() != null) {
	        Integer saleValueId = product.getSaleValue().getId();

	        // Truy vấn từ database
	        SaleValue fullSaleValue = entityManager.find(SaleValue.class, saleValueId);

	        if (fullSaleValue != null && fullSaleValue.getPercent() != null) {
	            Integer percent = fullSaleValue.getPercent();

	            if (percent >= 0 && percent <= 100) {
	                BigDecimal discount = originalPrice.multiply(BigDecimal.valueOf(percent))
	                        .divide(BigDecimal.valueOf(100));
	                BigDecimal salePrice = originalPrice.subtract(discount);
	                product.setSalePrice(salePrice);
	                return;
	            }
	        }
	    }

	    // Nếu không có giảm giá hợp lệ
	    product.setSalePrice(originalPrice);
	}
	public List<Product> findByIds(Set<Integer> ids) {
	    if (ids == null || ids.isEmpty()) {
	        return new ArrayList<>();
	    }

	    String jpql = "SELECT p FROM Product p WHERE p.id IN :ids";
	    return entityManager.createQuery(jpql, Product.class)
	                        .setParameter("ids", ids)
	                        .getResultList();
	}

	//category 
	    public List<SearchCategoryDTO> searchProducts(String category, String keyword) {
	        String jpql = "SELECT new vn.devpro.javawebProject31.dto.SearchCategoryDTO(" +
	                      "p.id, p.name, p.avatar, p.price, p.salePrice, c.name, sv.percent) " +
	                      "FROM Product p " +
	                      "JOIN p.category c " +
	                      "LEFT JOIN p.saleValue sv " +
	                      "WHERE (:category IS NULL OR c.name = :category) " +
	                      "AND (:keyword IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')))";

	        return entityManager.createQuery(jpql, SearchCategoryDTO.class)
	            .setParameter("category", (category != null && !category.trim().isEmpty()) ? category : null)
	            .setParameter("keyword", (keyword != null && !keyword.trim().isEmpty()) ? keyword : null)
	            .getResultList();
	    }
	    
	    public List<Product> getSaleProducts() {
	        String jpql = "SELECT p FROM Product p " +
	                      "WHERE p.status = true " +
	                      "AND p.salePrice > 0 " +
	                      "AND p.salePrice < p.price";
	        return entityManager.createQuery(jpql, Product.class)
	                            .getResultList();
	    }

}
