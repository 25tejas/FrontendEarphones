package com.niit.controller;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.dao.UserDAO;
import com.niit.daoimpl.UserDAOImpl;
import com.niit.model.User;

@Controller
@RequestMapping("/user")
public class UserController
{
	 @Autowired
	 UserDAO dao;
	
	 @RequestMapping("/") 
	 public String m1(ModelMap map) 
	 { 
		 map.addAttribute("users",dao.displayUsers());
		 return "users"; 
	 }
	 
	 @RequestMapping("/{id}") 
	 public String m2(ModelMap map) 
	 {
		 return "user"; 
	 }
	 
	 @RequestMapping("/add") 
	 public String m3(ModelMap map) 
	 {
		 map.addAttribute("user", new User()); 
		 return "register"; 
	 }
	
	 @PostMapping("/add") 
	 public String m4(@Valid @ModelAttribute("user") User u, BindingResult br)
	 {
		 if(!br.hasErrors())
		 {
			 u.setPassword(new BCryptPasswordEncoder().encode(u.getPassword()));
			 u.setEnabled(true);
			 u.setAuthority("user");
			 dao.addUser(u); 
			 return "index";
		 }
		 else
		 { 
			 return "register"; 
		 }
	 }
	 
	 @RequestMapping("/login") 
	 public String m5(ModelMap map) 
	 {
		 return "login"; 
	 }
	 
	 @RequestMapping("/edit/{id}")
	 public String m6(@PathVariable("id") int id,ModelMap map) 
	 {
		 User u=dao.displayUser(id);
		 map.addAttribute("edit",u);
		 return "register";
	 }
	 
	 @PostMapping("/update")
	 public String m7(@Valid @ModelAttribute("edit") User u,BindingResult br)
	 {
		 if(!br.hasErrors())
		 {
			 dao.updateUser(u);
			 return "redirect:/user/";
		 }
		 else
		 {
			 return "register";
		 }
	 }
	 
	 @RequestMapping("/delete/{id}")
	 public String m8(@PathVariable("id") int id,ModelMap map)
	 {
		 User u=new User();
		 u.setUserid(id);
		 dao.deleteUser(u);
		 return "redirect:/user/";
		 
	 }
	 
	 

	 

}