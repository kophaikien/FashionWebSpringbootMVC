package vn.devpro.javawebProject31.configurer;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import vn.devpro.javawebProject31.dto.Jw31Constants;



@Configuration
public class MvcConfigurer implements WebMvcConfigurer,Jw31Constants{
	
	@Bean
	public ViewResolver viewResolver() {
		// Xu ly va tra ve doi tuong view thong qua ten
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
	
	// Dang ky thu muc chua resource file (css, js, img, ...)
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		registry.addResourceHandler("/administrator/**").addResourceLocations("classpath:/administrator/");
		registry.addResourceHandler("/UploadFiles/**").addResourceLocations("file:" + FOLDER_UPLOAD);
	}
	
}