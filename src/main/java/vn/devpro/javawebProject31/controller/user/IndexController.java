package vn.devpro.javawebProject31.controller.user;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javawebProject31.model.Product;
import vn.devpro.javawebProject31.model.ProductImage;
import vn.devpro.javawebProject31.service.ProductImageService;
import vn.devpro.javawebProject31.service.ProductService;

@Controller

public class IndexController extends vn.devpro.javawebProject31.controller.BaseController {
	
	 
	@Autowired 
	private ProductService productService;
	
	@Autowired
	private ProductImageService productImageService; 
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	
	private String viewIndex(final Model model) { 
		
		List<Product> products = productService.findAllActive();
		model.addAttribute("products", products);
		return "user/index"; 
	}
	@RequestMapping(value = "category", method = RequestMethod.GET)
	public String viewCategory() { 
		return "user/category"; 
	}
	@RequestMapping(value = "/product/{productId}", method = RequestMethod.GET )
	public String viewProductPage(@PathVariable int productId,
			final Model model)
	{ 
		Product product = productService.getById(productId); 
		List<ProductImage> productImages = productImageService.getProductImageByProductId(productId); 
		model.addAttribute("productImages", productImages);
		model.addAttribute("product",	product); 
		return "user/product"; 
	}
	
}
