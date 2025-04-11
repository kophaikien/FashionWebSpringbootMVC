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
@RequestMapping(value ="/admin/role/")
public class RoleController {
	@Autowired
	private RoleService roleService; 
	
	@Autowired 
	private UserService userService; 
	@RequestMapping(value="view", method = RequestMethod.GET)
	public String viewRole(final  Model model) { 
		List<Role> roles = roleService.findAll(); 
		
		model.addAttribute("roles", roles);
		return "administrator/role/role-list"; 
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String viewAdd(final Model model) { 
		List<User> users = userService.findAll();
		Role role = new Role(); 
		role.setCreateDate(new Date());
		
		model.addAttribute("users", users); 
		model.addAttribute("role", role); 
		return "administrator/role/role-add";
	}
	
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String saveAdd(
			@ModelAttribute("role") Role role) { 
		roleService.saveOrUpdate(role); 
		return "redirect:/admin/role/add"; 
	}
	
	@RequestMapping(value = "edit/{roleId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable int roleId) {
		
		//Lay du lieu tu db de tron voi view tra ve cho browser
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		//Lay ban ghi category tu DB day vao form
		
		Role role = roleService.getById(roleId);
		
		//category.setCreateDate(new Date());
		role.setUpdateDate(new Date());
		model.addAttribute("role",role);
		
		return "administrator/role/role-edit";
	}
	
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(
			@ModelAttribute("role") Role role) {
		
		roleService.saveOrUpdate(role);
		
		return "redirect:/admin/role/view";
	}
	

	
	@RequestMapping(value = "delete/{roleId}", method = RequestMethod.GET)
	public String delete(@PathVariable int roleId) {
		
		//Lay du lieu trong DB
		Role role = roleService.getById(roleId);
		
		role.setStatus(false);
		roleService.saveOrUpdate(role);
		
		return "redirect:/admin/category/view";
	}
}
