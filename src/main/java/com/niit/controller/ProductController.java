package com.niit.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;
import com.niit.dao.ProductDAO;
import com.niit.dao.UserDAO;
import com.niit.model.Product;
import com.niit.model.User;

@Controller
@RequestMapping("/product")
public class ProductController
{
	 @Autowired
	 ProductDAO dao;
	 
	 @Autowired
	 UserDAO udao;
	
	 @RequestMapping("/") 
	 public String m1(ModelMap map) 
	 { 
		 map.addAttribute("products",dao.displayProducts());
		 return "products"; 
	 }
	 
	 @RequestMapping("/{pid}") 
	 public String m2(@PathVariable("pid") int id, ModelMap map) 
	 {
		 
		 map.addAttribute("row",dao.displayProduct(id));
		 return "product"; 
	 }
	 
	 @RequestMapping("/add") 
	 public String m3(ModelMap map) 
	 {
		 map.addAttribute("product", new Product()); 
		 return "addProduct"; 
	 }
	
	 @PostMapping("/add") 
	 public String m4(@Valid @ModelAttribute("product") Product p,BindingResult br)
	 {
		 if(!br.hasErrors())
		 {
			 dao.addProduct(p); 
			 return "redirect:/product/"; 
		 }
		 else{
				return "addProduct";
		 }
	 }

	@RequestMapping("/delete/{id}")
	public String m5(@PathVariable("id") int id)
	{
		Product p=new Product();
		p.setPid(id);
		dao.deleteProduct(p);	
		return "redirect:/product/";
	}
		
	@RequestMapping("/edit/{id}")
	public String m6(@PathVariable("id") int id,ModelMap map)
	{
		Product p=dao.displayProduct(id);
		map.addAttribute("edit",p);
		return "addProduct";
	}
		
	@PostMapping("/update")
	public String m7(@Valid @ModelAttribute("edit") Product product,BindingResult br)
	{
		if(!br.hasErrors())
		{
			dao.updateProduct(product);
			return "redirect:/product/";
		}
		else{
			return "addProduct";
		}
	}
	
	@RequestMapping("/search")
	public String m8(@RequestParam("search") String search,ModelMap map)
	{
		map.addAttribute("products", dao.findByName(search));
		return "products";
	}
	
	@RequestMapping("/type/{type}")
	public String m9(@PathVariable("type") String type,ModelMap map)
	{
		map.addAttribute("products", dao.findByType(type));
		return "products";
	}
	
	@RequestMapping("/hightolow")
	public String m10(ModelMap map)
	{
		map.addAttribute("products",dao.displayByPriceDesc());
		return "products";
	}
	
	@RequestMapping("/lowtohigh")
	public String m11(ModelMap map)
	{
		map.addAttribute("products",dao.displayByPriceAsc());
		return "products";
	}
	
	@RequestMapping("/order")
	public void m11(@RequestParam("pname") String pname, @RequestParam("price") float price, HttpServletResponse resp)
	{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String username="";
		if (principal instanceof UserDetails) 
		{
		  UserDetails user= ((UserDetails)principal);
		  username=user.getUsername();
		}
		
		User user=udao.displayUserByUsername(username);
		
		  try 
	       {
			  ApiContext context = ApiContext.create("test_RDf65b0U8TgIXtY4MswVRGkI5NPLtcMiSBr", "test_BHUqoRtbzOOjQeNayR6G6SKUTmW9TwkWx4Yl9E76K5HbaOVkE6fHDFLHNuGbYWyoQw4I3rWinc6ge3pHJvIroaBiSyYAhBTw8yDCklrhOFyPLK31eSq2ia6vXJm", ApiContext.Mode.TEST);
	           Instamojo api = new InstamojoImpl(context);

	           PaymentOrder order = new PaymentOrder();
	           order.setName(user.getUsername());
	           order.setEmail(user.getEmail());
	           order.setPhone("8080388053");
	           order.setCurrency("INR");
	           order.setAmount((double)price);
	           order.setDescription(pname);
	           order.setRedirectUrl("https://www.google.com");
	           order.setWebhookUrl("https://www.google.com");
	           order.setTransactionId(UUID.randomUUID().toString());

	           PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
	           resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
	       }
	       catch (Exception e) 
	       {
	           System.out.println(e);
	       }
	}
	
	

}