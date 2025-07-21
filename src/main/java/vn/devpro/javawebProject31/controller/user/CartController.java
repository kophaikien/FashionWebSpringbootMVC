package vn.devpro.javawebProject31.controller.user; 

import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.http.HttpRequest;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.devpro.javawebProject31.controller.BaseController;
import vn.devpro.javawebProject31.dto.Cart;
import vn.devpro.javawebProject31.dto.CartProduct;
import vn.devpro.javawebProject31.dto.Jw31Constants;
import vn.devpro.javawebProject31.dto.OrderInfo;
import vn.devpro.javawebProject31.enums.OrderStatus;
import vn.devpro.javawebProject31.model.Product;
import vn.devpro.javawebProject31.model.SaleOrder;
import vn.devpro.javawebProject31.model.SaleOrderProduct;
import vn.devpro.javawebProject31.model.User;
import vn.devpro.javawebProject31.service.ProductService;
import vn.devpro.javawebProject31.service.SaleOrderProductService;
import vn.devpro.javawebProject31.service.SaleOrderService;
import vn.devpro.javawebProject31.service.UserDetailsServiceImpl;
import vn.devpro.javawebProject31.service.UserService;

@Controller
public class CartController extends BaseController implements Jw31Constants {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	@Autowired 
	private UserService userService; 
	
	@Autowired 
	private SaleOrderProductService saleOrderProductService; 
	
	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(
			@RequestBody CartProduct cartProduct,
			final HttpServletRequest request, Principal principal) {
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		System.out.println(cartProduct.getSize());
		//Kiem tra so luong
		if (cartProduct.getQuantity().intValue() < 1) {
			jsonResult.put("code", 120);
			jsonResult.put("message", "Số lượng không hợp lệ");
		}
		else {
			if (principal == null) { 

				//Kiem tra co gio hang chua
				Cart cart = new Cart();
				HttpSession session = request.getSession();
				if (session.getAttribute("cart") == null) {//Chua co gio hang
					//Khoi tao gio hang
					session.setAttribute("cart", cart);
				}
				else {
					cart = (Cart) session.getAttribute("cart");
				}
				
				//Them san pham vao gio hang
				int index = cart.findProductByIdAndSize(cartProduct.getId(), cartProduct.getSize());
				if (index == -1) {//San pham chua co trong gio hang
					//Lay sp trong db
					Product product = productService.getById(cartProduct.getId());
					cartProduct.setAvatar(product.getAvatar());
					cartProduct.setPrice(product.getPrice());
					cartProduct.setSalePrice(product.getSalePrice());
					cartProduct.setName(product.getName());
					cart.getCartProducts().add(cartProduct);
				}
				else {//San pham da co trong gio hang
					
						cart.getCartProducts().get(index).updateQuantity(cartProduct.getQuantity());
						session.setAttribute("cart", cart);
				}
				System.out.println("session:" + cart.totalCartProduct());
				jsonResult.put("code", 420);
				jsonResult.put("message", "Đã thêm " + cartProduct.getQuantity() + 
						" '" + cartProduct.getName() + "size: " +cartProduct.getSize() +  "' vào giỏ hàng");
				//Tổng số sản phẩm trong giỏ hàng
				jsonResult.put("totalCartProducts", cart.totalCartProduct());
				
			}else {
				HttpSession session = request.getSession(); 
				 if (session.getAttribute("cart") != null) {
				        session.removeAttribute("cart");
				    }
				User loginedUser = userService.getUserByUsername(principal.getName()); 
				System.out.println("tên principal trả về:"+ principal.getName());
				SaleOrder saleOrderAsCart = saleOrderService.findCartByUser(loginedUser.getId()); 
				if (saleOrderAsCart == null) { 
					saleOrderAsCart = new SaleOrder(); 
					saleOrderAsCart.setUser(loginedUser);
					saleOrderAsCart.setStatus(OrderStatus.DANG_TRONG_GIO);;
					saleOrderAsCart.setCreateDate(new Date());
					saleOrderAsCart.setCustomerName(loginedUser.getName());
					saleOrderAsCart.setCustomerMobile(loginedUser.getMobile());
					saleOrderAsCart.setCustomerEmail(loginedUser.getEmail());
					saleOrderAsCart.setCustomerAddress(loginedUser.getAddress());
		            saleOrderAsCart.setSaleOrderProducts(new ArrayList());
		            saleOrderAsCart.setStatus(OrderStatus.DANG_TRONG_GIO);
		            Calendar calendar = Calendar.getInstance();
					int day= calendar.get(Calendar.DAY_OF_MONTH);
					int month= calendar.get(Calendar.MONTH)+1;
					int year = calendar.get(Calendar.YEAR);
					int hour= calendar.get(Calendar.HOUR_OF_DAY);
					int minute= calendar.get(Calendar.MINUTE);
					int second = calendar.get(Calendar.SECOND);
					String code= loginedUser.getMobile()+ year+month+day+hour+minute+second;
					saleOrderAsCart.setCode(code);
				}
				boolean found = false;
		        for (SaleOrderProduct item : saleOrderAsCart.getSaleOrderProducts()) {
		            if (item.getProduct().getId().equals(cartProduct.getId())
		                && item.getSize().equals(cartProduct.getSize())) {
		                item.setQuantity(item.getQuantity().intValue() + cartProduct.getQuantity().intValue());
		                found = true;
		                break;
		            }
		        }
	
		        if (!found) {
		            Product product = productService.getById(cartProduct.getId());
		            SaleOrderProduct newItem = new SaleOrderProduct();
		            newItem.setSaleOrder(saleOrderAsCart);
		            newItem.setProduct(product);
		            newItem.setSize(cartProduct.getSize());
		            newItem.setQuantity(cartProduct.getQuantity().intValue());
		            newItem.setPrice(product.getPrice());
		            newItem.setSalePrice(product.getSalePrice());
		            newItem.setName(product.getName());
		            saleOrderAsCart.getSaleOrderProducts().add(newItem);
		        }
		        int total = 0;
		        for (SaleOrderProduct item : saleOrderAsCart.getSaleOrderProducts()) {
		            total += item.getQuantity();
		        }
		        saleOrderAsCart.setTotalProducdt(total);
		        saleOrderService.saveOrUpdate(saleOrderAsCart);
	
		        // Tính tổng số lượng trong giỏ
		       
		        jsonResult.put("code", 420);
				jsonResult.put("message", "Đã thêm " + cartProduct.getQuantity() + 
						" '" + cartProduct.getName() + "size: " +cartProduct.getSize() +  "' vào giỏ hàng");
				//Tổng số sản phẩm trong giỏ hàng
				jsonResult.put("totalCartProducts", saleOrderAsCart.getTotalProducdt());
			}
		}
		return ResponseEntity.ok(jsonResult);
	}
//	
//	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
//	public String cartView(final HttpServletRequest request, final Model model, Principal principal){
//		if (principal == null) {
//		//Lay gio hang
//		HttpSession session = request.getSession();
//		String message = "";
//		BigInteger totalCartProduct = BigInteger.ZERO;
//		BigDecimal totalCartPrice = BigDecimal.ZERO;
//		if(session.getAttribute("cart")==null) {
//			message = "Bạn chưa có sản phẩm nào trong giỏ";
//		}else {
//			Cart cart = (Cart)session.getAttribute("cart");
//			totalCartProduct=cart.totalCartProduct();
//			totalCartPrice=cart.totalCartPrice();
//			message="Co " +totalCartProduct+"san pham trong gio hang";
//		}
//		
//		model.addAttribute("totalCartPrice", totalCartPrice);
//		model.addAttribute("message", message);
//		} else { 
//			User loginedUser = userService.getUserByUsername(principal.getName()); 
//			
//		}
//		return "user/cart-view";
//	}
	@RequestMapping(value="/cart-view", method = RequestMethod.GET)
	public String viewCart(HttpServletRequest request, Principal principal, Model model) {
	    List<Map<String, Object>> cartItems = new ArrayList<>();
	    BigInteger totalCartProducts = BigInteger.ZERO; 
        BigDecimal totalCartPrice = BigDecimal.ZERO; 
        String message =" ";
	    if (principal == null) {
	        Cart cart = (Cart) request.getSession().getAttribute("cart");
	        if (cart != null) {
	            for (CartProduct cp : cart.getCartProducts()) {
	                Map<String, Object> item = new HashMap<>();
	                item.put("name", cp.getName());
	                item.put("quantity", cp.getQuantity());
	                item.put("price", cp.getPrice());
	                item.put("salePrice", cp.getSalePrice()); 

	                item.put("avatar", cp.getAvatar());
	                item.put("size", cp.getSize()); 
	                item.put("id", cp.getId()); 
	                cartItems.add(item);
	            }
	           
	           totalCartPrice = cart.totalCartPrice();
	           totalCartProducts = cart.totalCartProduct(); 
	        }else { 
	        	message = "Bạn chưa có sản phẩm nào trong giỏ hàng"; 
	        }
	    } else {
	        User user = userService.getUserByUsername(principal.getName());
	        SaleOrder saleOrder = saleOrderService.findCartByUser(user.getId());
	        if (saleOrder != null) {
	            for (SaleOrderProduct sop : saleOrder.getSaleOrderProducts()) {
	            	
	   
	                Map<String, Object> item = new HashMap<>();
	                item.put("name", sop.getProduct().getName());
	                item.put("quantity", sop.getQuantity());
	                item.put("price", sop.getPrice());
	                item.put("salePrice", sop.getSalePrice()); 
	                item.put("avatar", sop.getProduct().getAvatar());
	                item.put("size", sop.getSize());
	                item.put("id", sop.getProduct().getId()); 
	                cartItems.add(item);
	            }
	            totalCartPrice = saleOrderService.totalSaleOrderPrice(saleOrder);
	            totalCartProducts = BigInteger.valueOf(saleOrder.getSaleOrderProducts().size());
	        }else {
	        	 message = "Bạn chưa có sản phẩm nào trong giỏ hàng"; 
	        }
	    }
        System.out.println(cartItems.toString());
        model.addAttribute("totalCartProducts", totalCartProducts);
	    model.addAttribute("message", message); 
	    model.addAttribute("totalCartPrice", totalCartPrice); 
	    model.addAttribute("cartItems", cartItems);
	    return "user/cart-view"; // tương ứng cart-view.jsp
	}
	@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateProductQuantity(
			@RequestBody CartProduct cartProduct,
			final HttpServletRequest request,
			Principal principal){
		Map<String, Object> jsonResult= new HashMap<String, Object>();
		if (principal == null) { 
			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
		
		//Tim san pham trong gio hang
			int index=cart.findProductByIdAndSize(cartProduct.getId(), cartProduct.getSize());
			BigInteger newQuantity= cartProduct.getQuantity(); 
			cart.getCartProducts().get(index).setQuantity(newQuantity);
		
		jsonResult.put("newQuantity", newQuantity);

		jsonResult.put("totalPrice", toCurrency(cart.getCartProducts().get(index).totalPrice()));
		jsonResult.put("totalCartProducts", cart.totalCartProduct());
		jsonResult.put("totalCartPrice", toCurrency(cart.totalCartPrice()));
		jsonResult.put("productId", cartProduct.getId());
		}else { 
			User loginedUser = userService.getUserByUsername(principal.getName()); 
			SaleOrder saleOrderAsCart = saleOrderService.findCartByUser(loginedUser.getId());
			BigInteger newQuantity = cartProduct.getQuantity(); 
			
			int index = saleOrderProductService.getSaleOrderProductByProductId(saleOrderAsCart, cartProduct.getId(), cartProduct.getSize());
			System.out.println("size: " + cartProduct.getSize());
			System.out.println("cartProductID: " + cartProduct.getId()); 
			saleOrderAsCart.getSaleOrderProducts().get(index).setQuantity(newQuantity.intValue());
			
			saleOrderService.saveOrder(saleOrderAsCart);
			
			jsonResult.put("totalPrice", toCurrency(saleOrderProductService.totalPrice(saleOrderAsCart.getSaleOrderProducts().get(index))));
			jsonResult.put("totalCartPrice", toCurrency(saleOrderService.totalSaleOrderPrice(saleOrderAsCart)));
			jsonResult.put("productId", cartProduct.getId());
			jsonResult.put("newQuantity", newQuantity);

		}
		return ResponseEntity.ok(jsonResult);
	}
	
	//Chuyen so sang chuoi dinh dang tien te
	public StringBuilder toCurrency(BigDecimal money) {
		StringBuilder str = new StringBuilder(""+money.longValue());
		int i =str.length()-3;
		int j = 0;
		while (i>0) {
			if(j%3==0) {
				str.insert(i, ",");
			}
			i--;
			j++;
		}
		return str;
	}
	
	@RequestMapping(value = "/delete/{productId}", method =  RequestMethod.GET)
	public String deleteProductInCart(@PathVariable("productId") int productId,
			final HttpServletRequest request, 
			@RequestParam("size") String size,
			Principal principal) {
		if (principal == null) { 
		HttpSession session=request.getSession();
		if(session.getAttribute("cart")!=null) {
			Cart cart = (Cart)session.getAttribute("cart");
			int index= cart.findProductByIdAndSize(productId, size);
			if(index!=-1) {
				cart.getCartProducts().remove(index);
			}
		}	
		} else { 
			User loginedUser = userService.getUserByUsername(principal.getName()); 
			if (loginedUser == null) {
			    // xử lý lỗi user không tồn tại
			    throw new RuntimeException("User not found");
			}
			SaleOrder saleOrderAsCart = saleOrderService.findCartByUser(loginedUser.getId());
			saleOrderProductService.removeSaleOrderProductByIdAndSize(productId, size,saleOrderAsCart.getId().intValue());
		}
		return "redirect:/cart-view";
	}
	


	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> placeOrder(
			final HttpServletRequest request,
			@RequestBody OrderInfo orderInfo, 
			Model model, 
			Principal principal){
		
		Map<String, Object> jsonResult= new HashMap<String, Object>();
		if (principal == null) {
			if(orderInfo.getName()==null||StringUtils.isEmpty(orderInfo.getName())) {
				jsonResult.put("code", 404);
				jsonResult.put("message", "Ban chua nhap ho ten, xin nhap");
			}else if(orderInfo.getMobile()==null||StringUtils.isEmpty(orderInfo.getMobile())) {
				jsonResult.put("code", 405);
				jsonResult.put("message", "Ban chua nhap dien thoai, xin nhap");
			}
			else {
				HttpSession session = request.getSession();
				if(session.getAttribute("cart")==null) {
					jsonResult.put("code", 406);
					jsonResult.put("message", "Ban chua co san pham nao trong gio hang");
				}else {
					if ("cod".equals(orderInfo.getPaymentMethod())) { 
							Cart cart= (Cart)session.getAttribute("cart");
							if(cart.getCartProducts()==null||cart.getCartProducts().size()<=0) {
								jsonResult.put("code", 406);
								jsonResult.put("message", "Ban chua co san pham nao trong gio hang");
							}else {
								
								Calendar calendar = Calendar.getInstance();
								int day= calendar.get(Calendar.DAY_OF_MONTH);
								int month= calendar.get(Calendar.MONTH)+1;
								int year = calendar.get(Calendar.YEAR);
								int hour= calendar.get(Calendar.HOUR_OF_DAY);
								int minute= calendar.get(Calendar.MINUTE);
								int second = calendar.get(Calendar.SECOND);
								String code= orderInfo.getMobile()+ year+month+day+hour+minute+second;
								
								SaleOrder saleOrder = new SaleOrder();
								saleOrder.setCode(code);
								saleOrder.setCreateDate(new Date());
								saleOrder.setCustomerName(orderInfo.getName());
								saleOrder.setCustomerMobile(orderInfo.getMobile());
								saleOrder.setCustomerEmail(orderInfo.getEmail());
								saleOrder.setCustomerAddress(orderInfo.getAddress());
								saleOrder.setStatus(OrderStatus.CHO_XAC_NHAN);;
								saleOrder.setPayment(orderInfo.getPaymentMethod());

								User user = new User(); 
								user.setId(3);
								saleOrder.setUser(user);
								saleOrder.setTotal(cart.totalCartPrice());
								
								//Luu cac san pham trong gio hang vao tbl_sale_order_product 
								for(CartProduct cartProduct: cart.getCartProducts()) {
									SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
									saleOrderProduct.setName(cartProduct.getName());
									saleOrderProduct.setQuantity(cartProduct.getQuantity().intValue());
									saleOrderProduct.setPrice(cartProduct.getPrice());
									saleOrderProduct.setSalePrice(cartProduct.getSalePrice());
									Product product = productService.getById(cartProduct.getId());
									saleOrderProduct.setProduct(product);
								
									saleOrderProduct.setSaleOrder(saleOrder);
									saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
								}

								saleOrderService.saveOrder(saleOrder);
								jsonResult.put("code", 200);
								jsonResult.put("message", "Bạn đã đặt hàng thành công, chúng tôi sẽ liên hệ với bạn sớm nhất có thể!");
								
								//Xoa gio hang sau khi dat hang thanh cong
								cart = new Cart();
								session.setAttribute("cart", cart);
					}
				}else if ("bank".equals(orderInfo.getPaymentMethod())) {
					Cart cart= (Cart)session.getAttribute("cart");
					if(cart.getCartProducts()==null||cart.getCartProducts().size()<=0) {
						jsonResult.put("code", 406);
						jsonResult.put("message", "Ban chua co san pham nao trong gio hang");
					}else {
						
						Calendar calendar = Calendar.getInstance();
						int day= calendar.get(Calendar.DAY_OF_MONTH);
						int month= calendar.get(Calendar.MONTH)+1;
						int year = calendar.get(Calendar.YEAR);
						int hour= calendar.get(Calendar.HOUR_OF_DAY);
						int minute= calendar.get(Calendar.MINUTE);
						int second = calendar.get(Calendar.SECOND);
						String code= orderInfo.getMobile()+ year+month+day+hour+minute+second;
						
						SaleOrder saleOrder = new SaleOrder();
						saleOrder.setCode(code);
						saleOrder.setCreateDate(new Date());
						saleOrder.setCustomerName(orderInfo.getName());
						saleOrder.setCustomerMobile(orderInfo.getMobile());
						saleOrder.setCustomerEmail(orderInfo.getEmail());
						saleOrder.setCustomerAddress(orderInfo.getAddress());
						saleOrder.setStatus(OrderStatus.CHO_XAC_NHAN);
						saleOrder.setPayment(orderInfo.getPaymentMethod());
						User user = new User(); 
						user.setId(3);
						saleOrder.setUser(user);
						saleOrder.setTotal(cart.totalCartPrice());
						
						//Luu cac san pham trong gio hang vao tbl_sale_order_product 
						for(CartProduct cartProduct: cart.getCartProducts()) {
							SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
							saleOrderProduct.setName(cartProduct.getName());
							saleOrderProduct.setQuantity(cartProduct.getQuantity().intValue());
							saleOrderProduct.setPrice(cartProduct.getPrice());
							saleOrderProduct.setSalePrice(cartProduct.getSalePrice());
							Product product = productService.getById(cartProduct.getId());
							saleOrderProduct.setProduct(product);
						
							saleOrderProduct.setSaleOrder(saleOrder);
							saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
						}
						
						saleOrderService.saveOrder(saleOrder);
						jsonResult.put("code", 200);
						jsonResult.put("message", "Bạn đã đặt hàng thành công, chúng tôi sẽ liên hệ với bạn sớm nhất có thể!");
						
						//Xoa gio hang sau khi dat hang thanh cong
						cart = new Cart();
						session.setAttribute("cart", cart);
					jsonResult.put("amount", orderInfo.getAmount());
					jsonResult.put("code", 202);
					jsonResult.put("message", "Vui lòng thanh toán đơn hàng");
					jsonResult.put("paymentResult", orderInfo.getPaymentMethod());
					
				}
			}
			}
		}
		}else {
			User loginedUser = userService.getUserByUsername(principal.getName()); 
			SaleOrder saleOrderAsCart = saleOrderService.findCartByUser(loginedUser.getId());
				if (saleOrderAsCart == null) { 
					jsonResult.put("code", 406);
					jsonResult.put("message", "Ban chua co san pham nao trong gio hang");
				}else { 
					saleOrderAsCart.setTotal(orderInfo.getAmount());
					if ("bank".equals(orderInfo.getPaymentMethod())) {
						jsonResult.put("amount", orderInfo.getAmount());
						jsonResult.put("code", 202);
						jsonResult.put("message", "Vui lòng thanh toán đơn hàng");
						jsonResult.put("paymentResult", orderInfo.getPaymentMethod());
						saleOrderAsCart.setStatus(OrderStatus.CHO_XAC_NHAN);
						saleOrderAsCart.setPayment(orderInfo.getPaymentMethod());
						saleOrderAsCart.setTotal(orderInfo.getAmount());
						saleOrderService.saveOrder(saleOrderAsCart);
					}else {
						jsonResult.put("code", 200);
						jsonResult.put("message", "Bạn đã đặt hàng thành công, chúng tôi sẽ liên hệ với bạn sớm nhất có thể!");
						saleOrderAsCart.setTotal(orderInfo.getAmount());
						saleOrderAsCart.setPayment(orderInfo.getPaymentMethod());

						saleOrderAsCart.setStatus(OrderStatus.CHO_XAC_NHAN);
						saleOrderService.saveOrder(saleOrderAsCart);
					}
				}
					
		}
		return ResponseEntity.ok(jsonResult);
		
	}
	
}
