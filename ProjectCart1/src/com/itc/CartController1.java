package com.itc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class CartController1 {

	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public String redirect2() {
	      return "redirect:/pages/homepage.html";
	   }
	   @RequestMapping(value = "/page2", method = RequestMethod.GET)
	   public String redirect1() {
	      return "redirect:/pages/page2.html";
	   }
	   
	/*   @RequestMapping(value="/addToCart" ,method= RequestMethod.POST )
	   public String addToCart(@ModelAttribute("SpringWeb")Product product, ModelMap model) {
		   model.addAttribute("id", product.getId());
		   model.addAttribute("pname", product.getPname());
		   model.addAttribute("price", product.getPrice());
		   model.addAttribute("quantity", product.getQuantity());
		   return "confirm";
	   }*/
	   
	   
	   @RequestMapping(value="/edit", method= RequestMethod.GET)
	   public String edit() {
		
		   return "edit";
	   }
	   
	   @RequestMapping(value="/update", method= RequestMethod.POST)
	   public String update() {
		   return "update";
	   }
	   
	   @RequestMapping(value="/insert", method= RequestMethod.POST)
	   public String insert() {
		   return "insert";
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
	   
	   @RequestMapping(value="/viewCart",method= RequestMethod.GET)
	   public String viewCart() {
		   return "viewCart";
	   }
	   @RequestMapping(value="/delete",method= RequestMethod.GET)
	   public String delete() {
		   return "delete";
	   }
	   
	  
		
}
