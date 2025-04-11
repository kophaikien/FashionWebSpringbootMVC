package vn.devpro.javawebProject31.configurer;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

//Class de chuyen cac request khac nhau theo role
public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	//dIEU HUONG DEN REQUEST
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		handle(request, response,authentication);
		clearAuthenticationAttributes(request);
		
	}
	
	//Dua vao role cua user login de xac dinh request chuyen den(redirect)
	private void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException{
		
		String targetUrl= determineTargetUrl(authentication); // lay url theo role cua user login
		if(response.isCommitted()) {
			return;
		}
		//System.out.println("targetUrl: "+targetUrl);
		redirectStrategy.sendRedirect(request, response, targetUrl);// dieu huong targetUrl
		
	}
	
	//Lay role cua user va tra ve url (action) tuong ung voi authentication
	protected String determineTargetUrl(Authentication authentication) throws IllegalStateException{
		
		Map<String, String> roleTargetUrlMap= new HashMap<String, String>(); 
		//key :Role-value:Url
		//Key la role name, value la Url(action)
		roleTargetUrlMap.put("ADMIN","/admin/home");
		roleTargetUrlMap.put("CUSTOMER", "/index");
		
		//Lay danh sach cac roles
		final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		
		//authoritiess lay trong class User
		for(final GrantedAuthority grantedAuthority : authorities) {
			String authorityName = grantedAuthority.getAuthority();//role name
			
			if(roleTargetUrlMap.containsKey(authorityName)) {
				//System.out.println("authorityName: "+authorityName);
				//System.out.println("role url map: "+roleTargetUrlMap.get(authorityName).toString());
				
				//Tra ve target url dang nhap
				return roleTargetUrlMap.get(authorityName);
			}
			
		}
		throw new IllegalStateException();
	}
	
	private void clearAuthenticationAttributes(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession(false);
		if(session==null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	
}
