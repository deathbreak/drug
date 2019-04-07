package com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.Manager;
import com.service.SellService;




@Controller
public class SellController {
			
	@Autowired
	SellService SeS;
	
	@RequestMapping("/sell")  //sell 
	public String to_sell(HttpSession hs,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("sellinfo", SeS.GetAllSellService());
			return "sell/sell";
		}else{
			return "../../index";
		}
	}
	
	//deletesell
	@RequestMapping(value="/deletesell",method=RequestMethod.POST)  //deletejinhuo
	public String to_deletesell(HttpSession hs,String drugname,String changshang,
			String pihao,String amount){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			SeS.DeleteSellService(drugname,changshang,pihao,amount);
			return "redirect:/sell";
		}else{
			return "../../index";
		}
	}
	
	//queryselldruginfo
	@RequestMapping("/queryselldruginfo")  
	public String to_queryselldruginfo(HttpSession hs,String querydrug,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("forSS", SeS.ForSellSelectService(querydrug));
			return "sell/sellselect";
		}else{
			return "../../index";
		}
	}
	
	//toaddsellamount
	@RequestMapping(value="/toaddsellamount",method=RequestMethod.POST)  
	public String to_toaddsellamount(HttpSession hs,String drugname,String changshang,String pihao,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("foraddamount", SeS.QueryDCPinStoreService(drugname,changshang,pihao));
			return "sell/sellamount";
		}else{
			return "../../index";
		}
	}
	//addsellamount
	@RequestMapping(value="/addsellamount",method=RequestMethod.POST)  
	public String to_addsellamount(HttpSession hs,String drugname,String changshang,String pihao,String amount){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			SeS.ProSellService(drugname,changshang,pihao,amount);
			return "redirect:/sell";
		}else{
			return "../../index";
		}
	}
	
	//sellit
	@RequestMapping(value="/sellit")  
	public String to_sellit(HttpSession hs){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			SeS.SellitService();
			return "redirect:/sell";
		}else{
			return "../../index";
		}
	}
	//printsell
	@RequestMapping(value="/printsell")  
	public String to_printsell(HttpSession hs){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			
			SeS.PrintService();
			
			return "redirect:/sell";
			
		}else{
			return "../../index";
		}
	}
}









