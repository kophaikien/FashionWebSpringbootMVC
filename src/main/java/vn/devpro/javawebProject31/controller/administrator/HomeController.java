package vn.devpro.javawebProject31.controller.administrator;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.devpro.javawebProject31.controller.BaseController;
import vn.devpro.javawebProject31.dto.ProfitDTO;
import vn.devpro.javawebProject31.enums.OrderStatus;
import vn.devpro.javawebProject31.model.SaleOrder;
import vn.devpro.javawebProject31.service.DashBoardService;
import vn.devpro.javawebProject31.service.ProfitService;
import vn.devpro.javawebProject31.service.SaleOrderService;

@Controller
@RequestMapping("/admin/")
public class HomeController extends BaseController{
	
	@Autowired 
	private DashBoardService dashboardService; 
	
	@Autowired
	private SaleOrderService saleOrderService; 
	
	@Autowired
	private ProfitService profitService; 
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	private String viewHome(Model model) {
		 model.addAttribute("totalUsers", dashboardService.getTotalUsers());
	        model.addAttribute("totalOrders", dashboardService.getTotalOrders());
	        model.addAttribute("totalRevenue", dashboardService.getTotalRevenue());
	        model.addAttribute("recentProductSales", dashboardService.getRecentProductSales());
		return "administrator/home"; 
	}
	
	@RequestMapping(value = "revenue/view", method = RequestMethod.GET)
	public String showStatistics(
	        @RequestParam(name = "beginDate", required = false)
	        @DateTimeFormat(pattern = "yyyy-MM-dd") Date beginDate,

	        @RequestParam(name = "endDate", required = false)
	        @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,

	        Model model) {

	    if (beginDate == null || endDate == null) {
	        Calendar cal = Calendar.getInstance();
	        endDate = cal.getTime();
	        cal.add(Calendar.DATE, -30);
	        beginDate = cal.getTime();
	    }

	    // Lấy danh sách đơn đã giao
	    List<SaleOrder> filteredOrders = saleOrderService.findOrdersByDateRangeAndStatus(beginDate, endDate, OrderStatus.DA_GIAO);

	    // Tính tổng doanh thu từ đơn đã giao
	    BigDecimal totalRevenue = saleOrderService.calculateRevenueByDateRangeAndStatus(beginDate, endDate, OrderStatus.DA_GIAO);

	    model.addAttribute("filteredOrders", filteredOrders);
	    model.addAttribute("totalRevenue", totalRevenue);
	    model.addAttribute("beginDate", beginDate);
	    model.addAttribute("endDate", endDate);

	    return "administrator/revenue";
	}

	    
	    @RequestMapping(value ="profit/view", method = RequestMethod.GET)
	    public String profitReport(
	            @RequestParam(name = "beginDate", required = false)
	            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate beginDate,

	            @RequestParam(name = "endDate", required = false)
	            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate endDate,

	            Model model) {

	        if (beginDate == null) {
	            beginDate = LocalDate.now().minusMonths(1);
	        }
	        if (endDate == null) {
	            endDate = LocalDate.now();
	        }

	        List<ProfitDTO> orders = profitService.getProfitStatsByDateRange(beginDate, endDate);
	        BigDecimal totalProfit = orders.stream()
	                .map(ProfitDTO::getTotalProfit)
	                .reduce(BigDecimal.ZERO, BigDecimal::add);

	        model.addAttribute("filteredOrders", orders);
	        model.addAttribute("totalProfit", totalProfit);
	        model.addAttribute("beginDate", beginDate);
	        model.addAttribute("endDate", endDate);

	        return "administrator/profit"; // đường dẫn JSP
	    }
	}

	

