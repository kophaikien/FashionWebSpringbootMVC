package vn.devpro.javawebProject31.controller.user;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javawebProject31.dto.ContactDTO;
import vn.devpro.javawebProject31.model.Contact;
import vn.devpro.javawebProject31.model.User;
import vn.devpro.javawebProject31.service.ContactService;

@Controller
@RequestMapping(value ="/user/contact/")
public class ContactController {
	
	@Autowired private ContactService contactService; 
	
	@RequestMapping(value = "view", method= RequestMethod.GET)
	public String viewContact(final Model model) { 
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = authentication.getPrincipal();

	    if (principal instanceof User) {
	    	User userDetails = (User) principal;
	        // Sử dụng userDetails để lấy thông tin người dùng
	        // Thực hiện các thao tác với userDetails
	    	User loginedUser = (User) authentication.getPrincipal();
			ContactDTO contactDTO = new ContactDTO(); 
			contactDTO.setAddress(loginedUser.getAddress());
			contactDTO.setEmail(loginedUser.getEmail());
			contactDTO.setMobile(loginedUser.getMobile());
			contactDTO.setName(loginedUser.getName());

			model.addAttribute("contactDTO", contactDTO); 
	    }
		else{ 
		ContactDTO contactDTO = new ContactDTO(); 
		model.addAttribute("contactDTO", contactDTO); 
		}
	    
		return "/user/contact";
	}
	
	@RequestMapping(value = "save-sf", method = RequestMethod.POST)
	public String saveSf(final Model model, 
			@ModelAttribute("contactDTO") ContactDTO contactDTO) { 
		Contact contact = new Contact(); 
		contact.setFirstname(contactDTO.getfirstname());
		contact.setLastname(contactDTO.getLastname());
		contact.setEmail(contactDTO.getEmail());
		contact.setMobile(contactDTO.getMobile());
		contact.setMessage(contactDTO.getMessage());
		contact.setAddress(contactDTO.getAddress());
		contact.setCreateDate(new Date());
		
		contactService.saveOrUpdate(contact); 
		return "redirect:view"; 
	}
	
}
