package com.ecoms.controller;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecoms.DAO.CategoryDAO;
import com.ecoms.DAO.ProductDAO;
import com.ecoms.DAO.SupplierDAO;
import com.ecoms.model.Category;
import com.ecoms.model.Product;
import com.ecoms.model.Supplier;





@Controller
public class ProductController {

	@Autowired
	ProductDAO productDAO;
	
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	@RequestMapping(value="AddProduct",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product")Product product,Model m)
	{
		productDAO.addProduct(product);
		
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		
		
		return "redirect:/product";
	}
	public LinkedHashMap<Integer,String> getSuppliers()
	{
		List<Supplier> listsupplier=supplierDAO.retrieveSupplier();
		LinkedHashMap<Integer,String> suppliersList=new LinkedHashMap<Integer,String>();
		
		for(Supplier supplier:listsupplier)
		{
			suppliersList.put(supplier.getSupplierId(),supplier.getSupplierName());
		}
		
		return suppliersList;
	}
	public LinkedHashMap<Integer,String> getCategories()
	{
		List<Category> listcategory=categoryDAO.retrieveCategory();
		LinkedHashMap<Integer,String> categoriesList=new LinkedHashMap<Integer,String>();
		
		for(Category category:listcategory)
		{
			categoriesList.put(category.getCategoryId(),category.getCategoryName());
		}
		
		return categoriesList;
	}
	
	
	@RequestMapping("/product")
	public String Showproduct(Model m)
	{
		Product product=new Product();
		m.addAttribute(product);
		
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		m.addAttribute("supplierList",this.getSuppliers());
		m.addAttribute("categoryList",this.getCategories());
		return "product";
	}
	
	
	
	@RequestMapping("/updateproduct")
	public String Showupdateproduct(Model m)
	{
		Product product=new Product();
		m.addAttribute(product);
		
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("ProductList",listProduct);
		return "product";
	}
	
	@RequestMapping(value="deleteProduct/{productId}",method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		System.out.println(product);
		
		productDAO.deleteProduct(product);
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		
		Product product1=new Product();
		m.addAttribute(product1);
		
		return "redirect:/product";
	}
	
	@RequestMapping(value="updateProduct/{productId}",method=RequestMethod.GET)
	public String updateProduct(@PathVariable("productId") int productId,Model m)
	{
		System.out.println("---");
		Product product=productDAO.getProduct(productId);
		m.addAttribute(product);
		
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		return "updateproduct";
	}
	
	@RequestMapping(value="updateproduct",method=RequestMethod.POST)
	public String updateMyProduct(@ModelAttribute("product")Product product,Model m)
	{
		productDAO.updateProduct(product);
		
		Product product1=new Product();
		m.addAttribute(product1);
		
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		
		return "redirect:/product";
	}

	@RequestMapping(value="productdisplay")
	public String showproductdispaly(Model m)
	{
		List<Product> listProducts=productDAO.retrieveProduct();
		m.addAttribute("productList",listProducts);
		
		return "productdisplay";
	}
	
}
