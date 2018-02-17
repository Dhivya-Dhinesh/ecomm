package com.ecoms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecoms.DAO.CartDAO;
import com.ecoms.DAO.ProductDAO;
import com.ecoms.DAO.RegisterDAO;
import com.ecoms.model.Cart;
import com.ecoms.model.Product;
import com.ecoms.model.Register;







@Controller
public class CartController {

	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	RegisterDAO registerDAO;
	
	
	
	
	
	@RequestMapping(value="AddCart/{productId}",method=RequestMethod.GET)
	public String addCart(@PathVariable("productId")int productId,HttpSession session,Model m)
	{
	
		
		
		Product cart1=productDAO.getProduct(productId);
		System.out.println(cart1);
		Cart cart = new Cart();
		cart.setProductId(cart1.getProductId());
		cart.setProductUnitPrice(cart1.getUnitPrice());
		cart.setProductName(cart1.getProductName());
		cart.setProductQuantity(1);
		//Register r=registerDAO.getRegisterBy((String) session.getAttribute("username"));
		//cart.setUserName(r.getUsername());
		
		cartDAO.addCart(cart);
		List<Cart> listProducts=cartDAO.retrieveCart();
		m.addAttribute("cartList",listProducts);
		
		return "cart";
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="deleteCart/{productId}",method=RequestMethod.GET)
	public String deleteCart(@PathVariable("productId")int productId,Model m)
	{
		Cart cart=cartDAO.getCart(productId);
		System.out.println(cart);
		
		
		cartDAO.deleteCart(cart);
		List<Cart> listCart=cartDAO.retrieveCart();
		m.addAttribute("cartList",listCart);
		
		Cart cart1=new Cart();
		m.addAttribute(cart1);
		
		return "redirect:/cart";
	}
	
	
	
	@RequestMapping("/cart")
	public String Showcart(Model m)
	{
		Cart cart=new Cart();
		m.addAttribute(cart);
		
		List<Cart> listCart=cartDAO.retrieveCart();
		m.addAttribute("cartList",listCart);
		return "cart";
	}
	
	
}


