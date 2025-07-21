package vn.devpro.javawebProject31.Mapper;

import java.math.BigDecimal;
import java.math.BigInteger;

import vn.devpro.javawebProject31.dto.ProductDTO;
import vn.devpro.javawebProject31.model.Product;
import vn.devpro.javawebProject31.model.Variant;

public class ProductMapper {
	public static ProductDTO productIntoProductDTO(Product product ) {
		ProductDTO productDTO = new ProductDTO(); 
		productDTO.setName(product.getName());
		productDTO.setAvatar(product.getAvartar());
		productDTO.setId(product.getId());
		productDTO.setPrice(product.getPrice());
		productDTO.setSalePrice(product.getSalePrice());
		productDTO.setShortDescription(product.getShortDescription());
		productDTO.setCategoryName(product.getCategory().getName());
		productDTO.setUpdateDate(product.getUpdateDate());
		productDTO.setCreateDate(product.getCreateDate());
		productDTO.setHot(product.getIsHot());
		productDTO.setOriginalPrice(product.getOriginalPrice());
		productDTO.setTotalQuantity(BigInteger.valueOf(
				product.getVariants()
				.stream()
				.map(Variant::getQuantity)              // Stream<BigInteger>
				.filter(q -> q != null)                 // lọc null nếu có
				.mapToInt(BigInteger::intValue)        // ép BigInteger → int
				.sum())
				
			);
		return productDTO;  
	}
	public static BigDecimal finalPrice(Product product) {
		BigDecimal result = product.getPrice();
	
		if (product.getSaleValue() != null) { 
			Integer percent = product.getSaleValue().getPercent(); 
			 result = result.add(result.multiply(BigDecimal.valueOf(percent/100.0)));
			 return result; 
		}
		else return result; 
	
	}
}
