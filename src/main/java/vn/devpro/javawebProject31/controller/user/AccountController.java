package vn.devpro.javawebProject31.controller.user;

import java.math.BigInteger;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.devpro.javawebProject31.enums.OrderStatus;
import vn.devpro.javawebProject31.model.Product;
import vn.devpro.javawebProject31.model.SaleOrder;
import vn.devpro.javawebProject31.model.SaleOrderProduct;
import vn.devpro.javawebProject31.model.User;
import vn.devpro.javawebProject31.service.ProductService;
import vn.devpro.javawebProject31.service.ReviewService;
import vn.devpro.javawebProject31.service.SaleOrderService;
import vn.devpro.javawebProject31.service.UserService;

@Controller

@RequestMapping(value = "/account/")
public class AccountController {
	
	@Autowired 
	private SaleOrderService saleOrderService; 
	
	@Autowired
	private ProductService productService; 
	
	@Autowired 
	private UserService userService; 
	
	@Autowired 
	private ReviewService reviewService; 
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String accountView(Model model, Principal principal) { 
		if (principal != null) { 
			User loginedUser = userService.getUserByUsername(principal.getName());
			model.addAttribute("loginedUser", loginedUser); 
		}else {
			return "login"; 
		}
		return "user/account"; 
	}
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(Model model, Principal principal, @ModelAttribute("user") User  user ) { 
		if (principal != null) { 
			User logined = userService.getUserByUsername(principal.getName()); 
			model.addAttribute("user",logined); 
			logined.setName(user.getName());
			logined.setAddress(user.getAddress());
			logined.setMobile(user.getMobile());
			logined.setEmail(user.getEmail());
			logined.setBirthDate(user.getBirthDate());
			userService.saveOrUpdate(logined); 
		}else {
			return "login"; 
		}
		return "redirect:/account/view"; 
	}
	@RequestMapping(value="bill", method = RequestMethod.GET)
	public String billView(Model model, Principal principal) { 
		if (principal == null) { 
			return "login"; 
		}else {
			User loginedUser = userService.getUserByUsername(principal.getName());
			model.addAttribute("loginedUser", loginedUser); 
			List<SaleOrder> saleOrders = saleOrderService.findAllCartByUser(loginedUser.getId()); 
			if (saleOrders == null || saleOrders.isEmpty()) { 
				return "user/bill-empty"; 
			}else {
				model.addAttribute("saleOrders", saleOrders); 
				return "user/bill"; 
			}
		}
		
	}
	
	@RequestMapping(value ="cancel-order", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> cancelOrder(@RequestParam("id") int id){ 
		SaleOrder  order = saleOrderService.getById(id);
		order.setStatus(OrderStatus.DA_HUY);
		saleOrderService.saveOrUpdate(order);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>(); 
		
		jsonResult.put("code",order.getCode()); 
		
		return ResponseEntity.ok(jsonResult); 
		
	}
	@RequestMapping(value = "saleOrder/{id}", method = RequestMethod.GET)
	public String singleOrderView(@PathVariable("id") int id,
	                              Model model,
	                              Principal principal) {
	    SaleOrder order = saleOrderService.getById(id);
	    model.addAttribute("order", order);

	    Map<Integer, Boolean> reviewedMap = new HashMap<>();

	    if (order != null && principal != null) {
	    	User loginedUser = userService.getUserByUsername(principal.getName());
			model.addAttribute("loginedUser", loginedUser); 

	        if (loginedUser != null && order.getSaleOrderProducts() != null) {
	            for (SaleOrderProduct sop : order.getSaleOrderProducts()) {
	                boolean reviewed = reviewService.hasCustomerReviewedProduct(
	                		loginedUser.getId(),
	                    sop.getProduct().getId()
	                );
	                reviewedMap.put(sop.getProduct().getId(), reviewed);
	            }
	        }
	    }

	    model.addAttribute("reviewedMap", reviewedMap);
	    return "user/single-order";
	}


	@RequestMapping(value= "review")
	public String postReview(Principal principal,
	                         @RequestParam("productId") Integer productId,
	                         @RequestParam("rating") Integer rating,
	                         @RequestParam("message") String comment, 
	                         @RequestParam("saleOrderId") int saleOrderId) {

	    // Lấy username của user đang đăng nhập
		 if (principal == null) {
		        return "redirect:/login"; // hoặc trả về lỗi
		    }
		 
	    String username = principal.getName();
	    System.out.println("productId" + productId);
	    System.out.println("rating" + rating);
	    System.out.println("message" + comment);	    
	    // Lấy user từ DB
	    User user = userService.getUserByUsername(username); 
	    Product product = productService.getById(productId.intValue());
	   

	    reviewService.saveReview(user, product, BigInteger.valueOf(rating), comment);

	    return "redirect:/account/saleOrder/" + saleOrderId;
	}


}
