package vn.devpro.javawebProject31.controller.administrator;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.javawebProject31.Mapper.ProductMapper;
import vn.devpro.javawebProject31.controller.BaseController;
import vn.devpro.javawebProject31.dto.Jw31Constants;
import vn.devpro.javawebProject31.dto.ProductDTO;
import vn.devpro.javawebProject31.dto.SearchModel;
import vn.devpro.javawebProject31.model.Category;
import vn.devpro.javawebProject31.model.Product;
import vn.devpro.javawebProject31.model.ProductImage;
import vn.devpro.javawebProject31.model.SaleValue;
import vn.devpro.javawebProject31.model.User;
import vn.devpro.javawebProject31.model.Variant;
import vn.devpro.javawebProject31.service.CategoryService;
import vn.devpro.javawebProject31.service.ProductImageService;
import vn.devpro.javawebProject31.service.ProductService;
import vn.devpro.javawebProject31.service.SaleValueService;
import vn.devpro.javawebProject31.service.UserService;

@Controller
@RequestMapping("/admin/product/")
public class ProductController extends BaseController implements Jw31Constants {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private SaleValueService saleValueService; 
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String view(final Model model,
			final HttpServletRequest request) {
		
		SearchModel searchModel = new SearchModel();
		
		//Tim kiem theo status
		
		
		
		//Tim theo category
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
		
		//Tim tu ngay den ngay
		searchModel.setBeginDate(null);
		searchModel.setEndDate(null);
		String endDate = request.getParameter("endDate");
		String beginDate = request.getParameter("beginDate");
		if (beginDate != null && !StringUtils.isEmpty(beginDate) && 
				endDate != null && !StringUtils.isEmpty(endDate)) {
			searchModel.setBeginDate(beginDate);
			searchModel.setEndDate(endDate);
		}
		
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		
		List<Product> allProducts = productService.search(searchModel);
		List<ProductDTO> allProductDTOs = allProducts.stream()
										.map(ProductMapper::productIntoProductDTO)
										.collect(Collectors.toList()); 
		//Tinh toan phan trangD
		searchModel.setCurrentPage(1); //Mac dinh la 1
		//Lay trang hien tai
		str = request.getParameter("currentPage");
		if (str != null && !StringUtils.isEmpty(str)) {
			searchModel.setCurrentPage(Integer.parseInt(str));
		}
		
		//Truong hop bam search de tim kiem
		str = request.getParameter("totalItems"); //tong so sp truoc tim kiem
		if (str != null && !StringUtils.isEmpty(str)) {
			int totalItems = Integer.parseInt(str);
			if (totalItems != allProductDTOs.size()) {//Tim kiem moi thi lai ve trang 1
				searchModel.setCurrentPage(1);
			}
		}
		
		searchModel.setTotalItems(allProductDTOs.size());
		searchModel.setSizeOfPage(SIZE_OF_PAGE);
		int totalPages = allProductDTOs.size() / SIZE_OF_PAGE;
		if (allProductDTOs.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		searchModel.setTotalPages(totalPages);
		
		//Lay danh sach cua trang hien tai
		int firstIndex = (searchModel.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int lastIndex = firstIndex + SIZE_OF_PAGE;
		if (lastIndex > allProducts.size()) {
			lastIndex = allProducts.size();
		}
		List<ProductDTO> productDTOs = allProductDTOs.subList(firstIndex, lastIndex);
		
		model.addAttribute("productDTOs", productDTOs);
		model.addAttribute("searchModel", searchModel);
		
		return "administrator/product/product-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		Product product = new Product();
		product.setCreateDate(new Date());
		model.addAttribute("product", product);
		
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		
		List<User> users = userService.findAdminUser();
		model.addAttribute("users", users);
		
		return "administrator/product/product-add";
	}
	
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String saveAddProduct(@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles
			) throws IOException {
		productService.applyDiscount(product);
		productService.saveProduct(product, avatarFile, imageFiles);
		
		return "redirect:/admin/product/add"; 
	}
	
	@RequestMapping(value = "edit/{productId}", method = RequestMethod.GET)
	public String edit(final Model model, @PathVariable int productId) {
		//Lay sp trong db
		Product product = productService.getById(productId);
		product.setUpdateDate(new Date());
		//product.setUserUpdateProduct(loginedUser);
		model.addAttribute("product", product);
		
		List<SaleValue> saleValues = saleValueService.findAllActive(); 
		model.addAttribute("saleValues", saleValues); 
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		
		List<User> users = userService.findAdminUser();
		model.addAttribute("users", users);
		
		return "administrator/product/product-edit";
	}
	
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String saveEditProduct(@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles 
			) throws IOException {
		Product productDb = productService.getById(product.getId()); 
		productDb.getVariants().clear();
		productDb.setSaleValue(product.getSaleValue());
		productService.applyDiscount(productDb);
		for (Variant v : product.getVariants()) {
	        // Check nếu dữ liệu đầy đủ
	        if (v.getSize() != null && v.getSku() != null && v.getQuantity() != null) {
	            v.setProduct(productDb); // liên kết ngược
	            productDb.getVariants().add(v); // thêm lại
	        }
	    }
		
		productService.saveEditProduct(productDb, avatarFile, imageFiles );
		
		return "redirect:/admin/product/view";
	}
	
	@Autowired
	private ProductImageService productImageService;
	
	@RequestMapping(value = "delete/{productId}", method = RequestMethod.GET)
	public String delete(final Model model, @PathVariable int productId) {
		//Lay sp trong db
		Product product = productService.getById(productId);
		//Xoa avatar
		if (product.getAvatar() != null && !StringUtils.isEmpty(product.getAvatar())) {
			String path = FOLDER_UPLOAD + product.getAvatar();
			File file = new File(path);
			file.delete();
			product.setAvatar(null);
		}
		//Xoa anh san pham
		//+ Xoa file anh
		List<ProductImage> productImages = 
				productImageService.getProductImageByProductId(productId);
		
		for (ProductImage productImage : productImages) {
			String path = FOLDER_UPLOAD + productImage.getPath();
			File file = new File(path);
			file.delete();
			
			productImage.setProduct(product);
			product.removeRelationalProductImage(productImage);
		}
		productService.delete(product); //xoa han
//		productService.saveOrUpdate(product);
		
		return "redirect:/admin/product/view";
	}

}
