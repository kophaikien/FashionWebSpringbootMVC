package vn.devpro.javawebProject31.service;

import org.springframework.stereotype.Service;

import vn.devpro.javawebProject31.model.Contact;

@Service
public class ContactService extends BaseService<Contact>{
 @Override
public Class<Contact> clazz() {
	// TODO Auto-generated method stub
	return Contact.class;
}
 
}
