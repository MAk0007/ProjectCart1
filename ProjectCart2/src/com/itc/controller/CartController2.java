package com.itc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.itc.dao.ProductDAO;
import com.itc.model.Product;



@Controller
public class CartController2 {
	@Autowired
	private ProductDAO ProductDAO;
	
	   @RequestMapping(value = "/homepage", method = RequestMethod.GET)
	   public String redirect2() {
	      return "redirect:/pages/homepage.html";
	   }
	   @RequestMapping(value = "/page2", method = RequestMethod.GET)
	   public String redirect1() {
	      return "redirect:/pages/page2.html";
	   }
	   
	   @RequestMapping(value = "/product1", method = RequestMethod.GET)
	    public ModelAndView product1() {
			return new ModelAndView("product1", "command", new Product());   
	   } 
	   @RequestMapping(value = "/product2", method = RequestMethod.GET)
	    public ModelAndView product2() {
			return new ModelAndView("product2", "command", new Product());   
	   } 
	   @RequestMapping(value = "/product3", method = RequestMethod.GET)
	    public ModelAndView product3() {
			return new ModelAndView("product3", "command", new Product());   
	   } 
	   @RequestMapping(value = "/product4", method = RequestMethod.GET)
	    public ModelAndView product4() {
			return new ModelAndView("product4", "command", new Product());   
	   } 
	   @RequestMapping(value = "/product5", method = RequestMethod.GET)
	    public ModelAndView product5() {
			return new ModelAndView("product5", "command", new Product());   
	   } 
	   @RequestMapping(value = "/product6", method = RequestMethod.GET)
	    public ModelAndView product6() {
			return new ModelAndView("product6", "command", new Product());  
	   }
	   
	   @RequestMapping(value = "/add", method = RequestMethod.POST)
		public ModelAndView addToCart(@ModelAttribute Product product) {
			boolean status=ProductDAO.add(product);
			String s= null;
			if(status==true){
 				s="Product successfully added to your cart";
 			}else{
 				s="Error occured while processing your request please try again later";
 			}
			return new ModelAndView("insert","status",s);
		}
	   @RequestMapping(value = "/update", method = RequestMethod.POST)
	 		public ModelAndView updateToCart(@ModelAttribute Product product) {
	 			boolean status = ProductDAO.update(product);	
	 			String s=null;
	 			if(status==true){
	 				s="Product quantity successfully updated in your cart";
	 			}else{
	 				s= "Error occured while processing your request please try again later";
	 			}
	 			ModelAndView model = new ModelAndView("update");
				model.addObject("status", s);
				return model;
	 		}
	   
	   @RequestMapping(value="/viewCart")
		public ModelAndView listProduct(ModelAndView model) throws IOException{
			List<Product> listProduct = ProductDAO.list();
			model.addObject("listProduct", listProduct);
			model.setViewName("viewCart");
			return model;
		}
	   
	   @RequestMapping("/delete/{id}")
		public ModelAndView delete(@PathVariable int id, Model model) {
			//int id = Integer.parseInt(request.getParameter("id"));
		   boolean status = ProductDAO.delete(id);
		   String s=null;
			if(status==true){
				s="Successfully deleted Product..!!";
			}else{
				s="Error occured while processing your request please try again later";
			}
			return new ModelAndView("delete","status",s);
		}
		
		@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
		public ModelAndView edit(@PathVariable int id, Model model) {
			//int id = Integer.parseInt(request.getParameter("id"));
			Product product = ProductDAO.get(id);
			ModelAndView model1 = new ModelAndView("edit","command",product);			
			return model1;
		}

}
