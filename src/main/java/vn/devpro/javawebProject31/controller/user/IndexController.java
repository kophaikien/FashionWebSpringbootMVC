package vn.devpro.javawebProject31.controller.user;




import java.net.http.HttpRequest;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.util.StringUtils.SearchMode;

import vn.devpro.javawebProject31.Mapper.ProductMapper;
import vn.devpro.javawebProject31.dto.ProductDTO;
import vn.devpro.javawebProject31.dto.SearchModel;
import vn.devpro.javawebProject31.model.Category;
import vn.devpro.javawebProject31.model.Product;
import vn.devpro.javawebProject31.model.ProductImage;
import vn.devpro.javawebProject31.model.Review;
import vn.devpro.javawebProject31.service.AprioriService;
import vn.devpro.javawebProject31.service.CategoryService;
import vn.devpro.javawebProject31.service.ProductImageService;
import vn.devpro.javawebProject31.service.ProductService;
import vn.devpro.javawebProject31.service.ReviewService;

@Controller

public class IndexController extends vn.devpro.javawebProject31.controller.BaseController {
	
	@Autowired
	private ReviewService reviewService; 
	@Autowired 
	private ProductService productService;
	
	@Autowired 
	private CategoryService categoryService; 
	
	@Autowired
	private ProductImageService productImageService; 
	
	@Autowired 
	private AprioriService aprioriService; 	
	
	@RequestMapping(value = "index", method = RequestMethod.GET)	
	private String viewIndex(final Model model) { 
		
		List<Product> products = productService.findAllActive();
		model.addAttribute("products", products);
		return "user/index"; 
	}
	@RequestMapping(value = "category", method = RequestMethod.GET)
	public String viewCategory(Model model, 
			@RequestParam(name = "category", required = false) String category,
			HttpServletRequest request
			) {
		SearchModel searchModel = new SearchModel(); 
		
		searchModel.setCategoryId(0); //All categories
		String str = request.getParameter("categoryId");
		if (str != null && !StringUtils.isEmpty(str)) {
			searchModel.setCategoryId(Integer.parseInt(str));
		}
		
		//Tim theo keyword
		searchModel.setKeyword(null);
		str = request.getParameter("keyword");
		if (str != null && !StringUtils.isEmpty(str)) {
			searchModel.setKeyword(str.trim().toLowerCase());
		}
		
		List<Product> products = productService.search(searchModel);
		model.addAttribute("products", products);
		String categoryId = request.getParameter("categoryId"); 
		model.addAttribute("selectedCategory", category); 
		List<Category> categories = categoryService.findAllActive(); 
		model.addAttribute("categories", categories); 
		model.addAttribute("selectedCategoryId",categoryId ); 
		return "user/category"; 
	}
	@RequestMapping(value = "sale", method = RequestMethod.GET)
	public String viewSale(Model model, 
			@RequestParam(name = "category", required = false) String category,
			HttpServletRequest request
			) {
		SearchModel searchModel = new SearchModel(); 
		
		searchModel.setCategoryId(0); //All categories
		String str = request.getParameter("categoryId");
		if (str != null && !StringUtils.isEmpty(str)) {
			searchModel.setCategoryId(Integer.parseInt(str));
		}
		
		//Tim theo keyword
		searchModel.setKeyword(null);
		str = request.getParameter("keyword");
		if (str != null && !StringUtils.isEmpty(str)) {
			searchModel.setKeyword(str.trim().toLowerCase());
		}
		
		List<Product> products = productService.searchSale(searchModel);
		model.addAttribute("products", products);
		String categoryId = request.getParameter("categoryId"); 
		model.addAttribute("selectedCategory", category); 
		List<Category> categories = categoryService.findAllActive(); 
		model.addAttribute("categories", categories); 
		model.addAttribute("selectedCategoryId",categoryId ); 
		return "user/category"; 
	}
	@RequestMapping(value = "/product/{productId}", method = RequestMethod.GET )
	public String viewProductPage(@PathVariable int productId,
			final Model model)
	{ 
		Product product = productService.getById(productId);
		ProductDTO dto = ProductMapper.productIntoProductDTO(product); 
		List<ProductImage> productImages = productImageService.getProductImageByProductId(productId); 
		List<Review> reviewList = reviewService.getReviewsByProductId(productId); 
		
		// 2. Gợi ý sản phẩm liên quan bằng Apriori
	    List<Set<Integer>> transactions = aprioriService.getAllTransactions();
	    Map<Set<Integer>, Integer> frequentItemsets = aprioriService.runApriori(transactions, 2); // minSupport = 2
	    Set<Integer> suggestedIds = aprioriService.suggestFromProduct(productId, frequentItemsets, 0.5); // confidence ≥ 50%

	    // 3. Truy vấn thông tin sản phẩm gợi ý
	    List<Product> suggestedProducts = productService.findByIds(suggestedIds);
	    model.addAttribute("suggestedProducts", suggestedProducts);
		
		model.addAttribute("reviewList", reviewList); 
		model.addAttribute("productImages", productImages);
		model.addAttribute("product",	product); 
		
		
		return "user/product"; 
	}
	
}
