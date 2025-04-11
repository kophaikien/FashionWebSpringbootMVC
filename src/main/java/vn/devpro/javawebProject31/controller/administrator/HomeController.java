package vn.devpro.javawebProject31.controller.administrator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javawebProject31.controller.BaseController;

@Controller
@RequestMapping("/admin/")
public class HomeController extends BaseController{
	@RequestMapping(value = "home", method = RequestMethod.GET)
	private String viewHome() {
		return "administrator/home"; 
	}
	
}
