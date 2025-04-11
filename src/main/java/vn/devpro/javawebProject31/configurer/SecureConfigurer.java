package vn.devpro.javawebProject31.configurer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import vn.devpro.javawebProject31.service.UserDetailsServiceImpl;


@Configuration
@EnableWebSecurity
public class SecureConfigurer extends WebSecurityConfigurerAdapter{
	
	@Override
	protected void configure(final HttpSecurity http) throws Exception{
		
		//Bat dau cau hinh
		http.csrf().disable().authorizeRequests() // Bat cac request tu browser
		
		//cho phep cac request, static resources khong bi rang buoc login
		.antMatchers("/user/**","/administrator/**", "/UpLoadFiles/**", "/login","/logout")
		.permitAll()
		
		//Cac requests kieu "/admin/**" phai login 
		//.antMatchers("/admin/**").authenticated() // step 1+2
		//Cac request kieu /admin/** phai co role la admin //step 3
		.antMatchers("/admin/**").hasAuthority("ADMIN")
		
		.and()
		
		//Neu chua login thi redirect den trang login
		//voi "/login/" la 1 request trong LoginController
		.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")
		
		//.defaultSuccessUrl("/admin/home/view",true) // login thanh cong vao tran ghome
		//back step 1+2
		//Login thanh cong chuyen den rewuset phu hop voi role step 3
		.successHandler(new UrlAuthenticationSuccessHandler())
		
		//Login khong thanh cong
		.failureUrl("/login?login_error=true")
	
		.and()
		
		//cau hinh phan logout
		.logout().logoutUrl("/logout").logoutSuccessUrl("/index").invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		
		.and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400);
	}
	@Autowired
	private UserDetailsServiceImpl userDetailsService;
	
	@Autowired 
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}
	
//	public static void main(String[] args) {
//		
//		System.out.println(new BCryptPasswordEncoder(4).encode("123"));
//		
//	}
	
}
