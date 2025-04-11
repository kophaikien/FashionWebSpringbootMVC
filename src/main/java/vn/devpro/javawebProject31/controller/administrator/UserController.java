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

import vn.devpro.javawebProject31.model.Role;
import vn.devpro.javawebProject31.model.User;
import vn.devpro.javawebProject31.service.RoleService;
import vn.devpro.javawebProject31.service.UserService;

@Controller
@RequestMapping(value ="/admin/user/")
public class UserController {
	@Autowired
	private RoleService roleService; 
	
	@Autowired 
	private UserService userService; 
	@RequestMapping(value="view", method = RequestMethod.GET)
	public String viewRole(final  Model model) { 
		List<User> users = userService.findAll(); 
		
		model.addAttribute("users",users);
		return "administrator/user/user-list"; 
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String viewAdd(final Model model) { 
		List<Role> roles= roleService.findAll();
		User user = new User(); 
		user.setCreateDate(new Date());
		
		model.addAttribute("roles", roles); 
		model.addAttribute("user", user); 
		return "administrator/user/user-add";
	}
	
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String saveAdd(
			@ModelAttribute("user") User user) { 
		userService.saveOrUpdate(user); 
		return "redirect:/admin/user/add"; 
	}
	
	@RequestMapping(value = "edit/{roleId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable int userId) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
				
		User user = userService.getById(userId);
		
	
		user.setUpdateDate(new Date());
		model.addAttribute("user",user);
		
		return "administrator/user/user-edit";
	}
	
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(
			@ModelAttribute("user") User user) {
		
		userService.saveOrUpdate(user);
		
		return "redirect:/admin/user/view";
	}
	

	
	@RequestMapping(value = "delete/{userId}", method = RequestMethod.GET)
	public String delete(@PathVariable int roleId) {
		
		//Lay du lieu trong DB
		User user = userService.getById(roleId);
		
		user.setStatus(false);
		userService.saveOrUpdate(user);
		
		return "redirect:/admin/category/view";
	}
}
