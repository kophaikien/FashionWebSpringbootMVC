package vn.devpro.javawebProject31.controller.administrator;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javawebProject31.controller.BaseController;
import vn.devpro.javawebProject31.model.Category;
import vn.devpro.javawebProject31.model.SaleValue;
import vn.devpro.javawebProject31.model.User;
import vn.devpro.javawebProject31.service.CategoryService;
import vn.devpro.javawebProject31.service.SaleValueService;
import vn.devpro.javawebProject31.service.UserService;


@Controller
@RequestMapping("/admin/saleValue/")
public class SaleValueController extends BaseController {
	
	//Khai bao service
	@Autowired
	private  SaleValueService saleValueService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String view(final Model model) {
		
		//Lay du lieu tu db de tron voi view tra ve cho browser
//		List<Category> categories = categoryService.findAll();
		List<SaleValue> saleValues = saleValueService.findAllActive();
		//Day du lieu sang view
		model.addAttribute("saleValues", saleValues);
		
		return "administrator/saleValue/sale-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		//Lay du lieu tu db de tron voi view tra ve cho browser
		List<User> users = userService.findAll();
		//Day du lieu sang view
		model.addAttribute("users", users);
		
		SaleValue saleValue = new SaleValue();
		
		saleValue.setCreateDate(new Date());
		//category.setUpdateDate(new Date());
		model.addAttribute("saleValue", saleValue);
		
		return "administrator/saleValue/sale-add";
	}
	
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String addSave(
			@ModelAttribute("saleValue") SaleValue saleValue) {
		
		saleValueService.saveOrUpdate(saleValue);
		
		return "redirect:/admin/saleValue/add";
	}
	
	@RequestMapping(value = "edit/{saleValueId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable int saleValueId) {
		
		//Lay du lieu tu db de tron voi view tra ve cho browser
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		//Lay ban ghi category tu DB day vao form
		
		SaleValue saleValue = saleValueService.getById(saleValueId);
		
		//category.setCreateDate(new Date());
		saleValue.setUpdateDate(new Date());
		model.addAttribute("saleValue", saleValue);
		
		return "administrator/saleValue/sale-edit";
	}
	
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(
			@ModelAttribute("saleValue") SaleValue saleValue) {
		
		saleValueService.saveOrUpdate(saleValue);
		
		return "redirect:/admin/saleValue/view";
	}
	
//	@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
//	public String delete(@PathVariable int categoryId) {
//		
//		categoryService.deleteCategoryById(categoryId);
//		
//		return "redirect:/admin/category/view";
//	}
	
	@RequestMapping(value = "delete/{saleValueId}", method = RequestMethod.GET)
	public String delete(@PathVariable int saleValueId) {
		
		//Lay du lieu trong DB
		SaleValue saleValue = saleValueService.getById(saleValueId);
		
		saleValueService.delete(saleValue);
//		saleValueService.saveOrUpdate(saleValue);
		
		return "redirect:/admin/saleValue/view";
	}
}

