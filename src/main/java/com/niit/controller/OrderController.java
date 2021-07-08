package com.niit.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
import com.niit.dao.CartDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.UserDAO;
import com.niit.model.*;

@Controller
@RequestMapping("/cart")
public class OrderController {
	@Autowired
	ProductDAO dao;

	@Autowired
	UserDAO udao;

	@Autowired(required = true)
	CartDAO cdao;

	@RequestMapping("/")
	public String m1(ModelMap map) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			UserDetails user = ((UserDetails) principal);
			User u = udao.displayUserByUsername(user.getUsername());
			map.addAttribute("carts", u.getCart());
		}
		return "cart";
	}

	@RequestMapping("/add/{pid}")
	public String m2(@PathVariable("pid") int pid) {

		Product product = dao.displayProduct(pid);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			UserDetails user = ((UserDetails) principal);
			User u = udao.displayUserByUsername(user.getUsername());
			Cart cart = new Cart();
			cart.setUser(u);
			cart.setProduct(product);
			cart.setQty(1);
			cart.setPrice(product.getPrice());
			cart.setStatus("unordered");
			cdao.addCart(cart);
		}
		return "redirect:/cart/";
	}

	@PostMapping("/update")
	public String m3(@ModelAttribute("edit") Cart cart) {
		cdao.updateCart(cart);
		return "redirect:/cart/";
	}

	@RequestMapping("/delete/{id}")
	public String m4(@PathVariable("id") int id) {
		cdao.deleteCart(id);
		return "redirect:/cart/";
	}

	
	@RequestMapping("/buy/{cid}")
	public void m5(@PathVariable("cid") int cid,HttpServletResponse resp) 
	{ 
		Cart cart=cdao.getCart(cid);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			UserDetails u = ((UserDetails) principal);
			User user = udao.displayUserByUsername(u.getUsername());
			try 
			{
				ApiContext context = ApiContext.create("test_RDf65b0U8TgIXtY4MswVRGkI5NPLtcMiSBr", "test_BHUqoRtbzOOjQeNayR6G6SKUTmW9TwkWx4Yl9E76K5HbaOVkE6fHDFLHNuGbYWyoQw4I3rWinc6ge3pHJvIroaBiSyYAhBTw8yDCklrhOFyPLK31eSq2ia6vXJm",
				ApiContext.Mode.TEST); Instamojo api = new InstamojoImpl(context);
				  
				PaymentOrder order = new PaymentOrder(); order.setName(user.getUsername());
				order.setEmail(user.getEmail()); order.setPhone("8080388053");
				order.setCurrency("INR"); order.setAmount((double)cart.getProduct().getPrice());
				order.setDescription(cart.getProduct().getPname()); order.setRedirectUrl("https://www.google.com");
				order.setWebhookUrl("https://www.google.com");
				order.setTransactionId(UUID.randomUUID().toString());
				  
				PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
				Cart uc=cdao.getCart(cid);
				uc.setStatus("ordered");
				cdao.updateCart(uc);
				resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
			} 
			catch (Exception e) 
			{ 
				System.out.println(e); 
			} 

		}
	}
	
}