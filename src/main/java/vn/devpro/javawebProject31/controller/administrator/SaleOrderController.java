package vn.devpro.javawebProject31.controller.administrator;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.devpro.javawebProject31.enums.OrderStatus;
import vn.devpro.javawebProject31.model.Category;
import vn.devpro.javawebProject31.model.Product;
import vn.devpro.javawebProject31.model.SaleOrder;
import vn.devpro.javawebProject31.model.SaleOrderProduct;
import vn.devpro.javawebProject31.model.SaleValue;
import vn.devpro.javawebProject31.model.User;
import vn.devpro.javawebProject31.model.Variant;
import vn.devpro.javawebProject31.service.ProductService;
import vn.devpro.javawebProject31.service.SaleOrderService;
import vn.devpro.javawebProject31.service.UserService;

@Controller
@RequestMapping(value ="/admin/saleOrder/")
public class SaleOrderController {
	
	@Autowired
	private SaleOrderService saleOrderService; 
	
	@Autowired
	private UserService userService; 
	
	@Autowired
	private ProductService productService; 
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String view(Model model) { 
		List<SaleOrder> saleOrders = saleOrderService.findAll(); 
		model.addAttribute("saleOrders", saleOrders); 
		return "administrator/saleOrder/saleOrder-list"; 
	}
	
	@RequestMapping(value = "edit-saleOrder/{saleOrderId}", method = RequestMethod.GET)
	public String edit(final Model model, @PathVariable int saleOrderId) {
		//Lay order trong db
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		saleOrder.setUpdateDate(new Date());
		//product.setUserUpdateProduct(loginedUser);
		model.addAttribute("saleOrder", saleOrder);
		
		
		model.addAttribute("orderStatuses", OrderStatus.values());
		
	
		return "administrator/saleOrder/saleOrder-edit";
	}
	

	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String saveEditProduct(@ModelAttribute("saleOrder") SaleOrder saleOrderForm, RedirectAttributes redirect) {
	    SaleOrder saleOrder = saleOrderService.fetchOrderWithVariants(saleOrderForm.getId());

	    if (saleOrder == null) {
	        redirect.addFlashAttribute("error", "Không tìm thấy đơn hàng.");
	        return "redirect:/admin/saleOrder/list";
	    }

	    if (saleOrder.getStatus() != OrderStatus.DA_GIAO && saleOrderForm.getStatus() == OrderStatus.DA_GIAO) {
	        for (SaleOrderProduct sop : saleOrder.getSaleOrderProducts()) {
	            Product product = sop.getProduct();
	            String size = sop.getSize();

	            if (product.getVariants() == null || product.getVariants().isEmpty()) {
	                redirect.addFlashAttribute("error", "Sản phẩm \"" + product.getName() + "\" không có biến thể.");
	                return "redirect:/admin/edit-saleOrder/" + saleOrder.getId();
	            }

	            
	            Optional<Variant> variantOpt = product.getVariants().stream()
	            	    .filter(v -> v.getSize() != null
	            	        && v.getSize().trim().equalsIgnoreCase(size != null ? size.trim() : ""))
	            	    .findFirst();

	            System.out.println("=== Kiểm tra biến thể ===");
	            System.out.println("Sản phẩm: " + product.getName());
	            System.out.println("Size từ SaleOrderProduct: [" + size + "]");

	            for (Variant v : product.getVariants()) {
	                System.out.println(" - Variant size: [" + v.getSize() + "]");
	            }
	            if (variantOpt.isPresent()) {
	                Variant variant = variantOpt.get();
	                int newQty = variant.getQuantity().intValue() - sop.getQuantity();
	                if (newQty < 0) {
	                    redirect.addFlashAttribute("error", "Không đủ tồn kho size " + size + " cho sản phẩm " + product.getName());
	                    return "redirect:/admin/edit-saleOrder/" + saleOrder.getId();
	                }
	                variant.setQuantity(BigInteger.valueOf(newQty));
	                // Nếu có VariantService thì có thể gọi update(variant) ở đây
	            } else {
	                redirect.addFlashAttribute("error", "Không tìm thấy biến thể size " + size + " cho sản phẩm " + product.getName());
	                return "redirect:/admin/saleOrder/edit-saleOrder/" + saleOrder.getId();
	            }
	        }
	    }

	    saleOrder.setStatus(saleOrderForm.getStatus());
	    saleOrder.setUpdateDate(new Date());
	    saleOrderService.saveOrUpdate(saleOrder);

	    redirect.addFlashAttribute("msg", "Cập nhật đơn hàng thành công.");
	    return "redirect:/admin/saleOrder/view";
	}


	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCreateDate(new Date());
		model.addAttribute("saleOrder", saleOrder);
		
		
		
		List<User> users = userService.findAdminUser();
		model.addAttribute("users", users);
		
		return "administrator/saleOrder/saleOrder-add";
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
}
