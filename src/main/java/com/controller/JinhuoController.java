package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Drug;
import com.bean.Gonghuoshang;
import com.bean.Jinhuo;
import com.bean.Manager;
import com.bean.Msg;
import com.service.JinhuoService;



@Controller
public class JinhuoController {
		
	@Autowired
	JinhuoService JS;
	
	@RequestMapping("/tostore")  //jinhuo
	public String to_tostore(HttpSession hs,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("jinhuo", JS.GetAllJinhuoService());
			return "tostore/tostore";
		}else{
			return "../../index";
		}
	}
	@RequestMapping("/jhrecords")  //jhrecords
	public String to_jhrecords(HttpSession hs){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			return "tostore/jhrecords";
		}else{
			return "../../index";
		}
	}
	@RequestMapping("/ghsinfo")  //jhrecords
	public String to_ghsinfo(HttpSession hs){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			return "tostore/ghsinfo";
		}else{
			return "../../index";
		}
	}
	@RequestMapping(value="/deletejinhuo",method=RequestMethod.POST)  //deletejinhuo
	public String to_deletejinhuo(HttpSession hs,String drugname,String changshang,
			String pihao,String amount){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			JS.DeleteJinhuoService(drugname,changshang,pihao,amount);
			return "redirect:/tostore";
		}else{
			return "../../index";
		}
	}
	//cpsh
	@RequestMapping("/cpsh") 
	public String to_cpsh(HttpSession hs){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			JS.CpshService();
			return "redirect:/tostore";
		}else{
			return "../../index";
		}
	}
	//queryjhdruginfo
	@RequestMapping("/queryjhdruginfo")  
	public String to_queryjhdruginfo(HttpSession hs,String querydrug,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("forselect", JS.ForSelectService(querydrug));
			return "tostore/jinhuoselect";
		}else{
			return "../../index";
		}
	}
	//toaddjinhuo
	@RequestMapping("/toaddjinhuo")  
	public String to_toaddjinhuo(HttpSession hs,@Valid Drug drug,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("druginfo", drug);
			map.put("ghsinfo", JS.GetAllGhsService());
			return "tostore/toaddjinhuo";
		}else{
			return "../../index";
		}
	}
	//addjinhuo
	@RequestMapping("/addjinhuo")  
	public String to_addjinhuo(HttpSession hs,@Valid Jinhuo j){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			JS.AddJinhuoService(j);
			return "redirect:/tostore";
		}else{
			return "../../index";
		}
	}
	
	
	
	//getghsinfo
	@ResponseBody
	@RequestMapping(value="/getghsinfo",method=RequestMethod.POST)  
	public List<Gonghuoshang> to_getghsinfo(HttpSession hs){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			return JS.GetAllGhsService();
		}else{
			return null;
		}
	}
	
	//delghsinfo
	@ResponseBody
	@RequestMapping(value="/delghsinfo",method=RequestMethod.POST)  
	public Msg to_delghsinfo(HttpSession hs,String delargs){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			return JS.DelGhsCheckService(delargs);
		}else{
			return null;
		}
	}
	//delghs-records
	@RequestMapping("/delghs-records")  
	public String to_delghs_records(HttpSession hs,String confirmdel){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			JS.DelGhsAndRecordsService(confirmdel);
			return "redirect:/ghsinfo";
		}else{
			return "../../index";
		}
	}
	
	//addghsinfo
	@ResponseBody
	@RequestMapping(value="/addghsinfo",method=RequestMethod.POST)  
	public Msg to_addghsinfo(HttpSession hs,String addval){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			if(!addval.equals("")){
		       return JS.AddGhsService(addval);
			}
			return null;
		}else{
			return null;
		}
	}
	
	
	
}













