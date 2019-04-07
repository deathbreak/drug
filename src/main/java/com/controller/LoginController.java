package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.Manager;
import com.service.ManagerService;
import com.service.SellService;
import com.service.StoreService;

@Controller
public class LoginController {
	@Autowired
	StoreService SS;
		
	@Autowired
	ManagerService  checkuser;
	
	@Autowired
	SellService SellS;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String logincheck(@RequestParam(value="username",required=true)String username,
			@RequestParam(value="password")String password,HttpSession hs,Map<String,Object> map){
			if(username.equals("")&&password.equals("")){
					map.put("logininfouser", "用户名或密码不能为空");
					return "../../index";
			}else{
				List<Manager> ck = checkuser.QueryUserService(username);
				int N=0;
				int P=0;
				for (Manager it : ck) {
				if (username.equals(it.getUser())) {
					N = 111111;
					if (password.equals(it.getPassword())) {
						P = 111111;
						Manager login = new Manager();
						login.setUser(username);
						login.setPassword(password);
						hs.setAttribute("login", login);
						return "redirect:/main";
					} else {
						N++;
					}
				}
				}
				if(N<111111){
					map.put("logininfouser", "该用户尚未注册，登录失败");
					return "../../index";
                }
				if(P<111111){
        		    map.put("logininfopass", "用户密码不正确，登录失败");
					return "../../index";
                }
				return "../../index";
			}
		
	}
	
	@RequestMapping("/date")  //date 效期提示
	public String to_date(HttpSession hs,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("datetips", SS.CheckStoreService());
			return "date/date";
		}else{
			return "../../index";
		}
	}
	@RequestMapping("/rx")  //rx 
	public String to_rx(HttpSession hs){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			return "rx/rx";
		}else{
			return "../../index";
		}
	}
	@RequestMapping("/sellover")  //sellover 
	public String to_sellover(HttpSession hs,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("sellover", SellS.GetASService());
			return "sellover/sellover";
		}else{
			return "../../index";
		}
	}
	//delsellover
	@RequestMapping("/delsellover")  //sellover 
	public String to_delsellover(HttpSession hs,String drugname,String changshang,String pihao){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			SellS.DelSelloverService(drugname,changshang,pihao);
			return "redirect:/sellover";
		}else{
			return "../../index";
		}
	}
	
	@RequestMapping("/storetip")  //storetip 
	public String to_storetip(HttpSession hs){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			return "storetip/storetip";
		}else{
			return "../../index";
		}
	}
	@RequestMapping(value="/tips")  //tips销售记录
	public String to_tips(HttpSession hs,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("alltips", SellS.GetRecordsService(""));
			return "tips/tips";
		}else{
			return "../../index";
		}
	}
	@RequestMapping(value="/gettips",method=RequestMethod.POST)  //tips销售记录
	public String to_gettips(HttpSession hs,String selltime,Map<String,Object> map){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			map.put("alltips", SellS.GetRecordsService(selltime));
			return "tips/tips";
		}else{
			return "../../index";
		}
	}
	@RequestMapping(value="/deltips",method=RequestMethod.POST)  //tips销售记录
	public String to_deltips(HttpSession hs,String drugname,String changshang,String pihao,String selltime){
		Manager fl = (Manager) hs.getAttribute("login");
		if(fl!=null) { 
			SellS.DelRecordsService(drugname, changshang, pihao, selltime);
			return "redirect:/tips";
		}else{
			return "../../index";
		}
	}
}
