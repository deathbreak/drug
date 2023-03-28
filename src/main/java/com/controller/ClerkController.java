package com.controller;

import com.bean.Manager;
import com.bean.Rxdrug;
import com.bean.Rxperson;
import com.service.ManagerService;
import com.service.RxService;
import com.service.SellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;


//和店员相关
@Controller
public class ClerkController {

    @Autowired
    ManagerService MS;

    @Autowired
    RxService RS;

    @Autowired
    SellService SeS;

    @RequestMapping("/register")
    public String to_register() {
        return "../../register";
    }

    @PostMapping("/register_user")
    public String to_register_user(Manager _manager, Map<String, Object> map) {
//        System.out.println(_manager.getUser() + "," + _manager.getPassword() + "," + _manager.getRole());
        map.put("info", MS.AddUser(_manager) ? 1 : 0);
        return "../../register";
    }

    @RequestMapping("/clerk_manage")
    public String to_clerk_manage(Map<String, Object> map) {
        map.put("info", MS.GetClerk());
        return "forclerk/clerk_manage";
    }

    @PostMapping("/del_clerk")
    public String del_clerk_info(String username) {
        MS.DelClerk(username);
        return "redirect:/clerk_manage";
    }

//    @RequestMapping("/main_user")
//    public String redirect_to_main(){
//        return "main_user";
//    }


    //sell

    @RequestMapping("/sell_user")  //sell
    public String to_sell(Map<String, Object> map) {
        map.put("sellinfo", SeS.GetAllSellService());
        return "sell/sell_user";
    }

    //deletesell
    @RequestMapping(value = "/deletesell_user", method = RequestMethod.POST)  //deletejinhuo
    public String to_deletesell(String drugname, String changshang,
                                String pihao, String amount) {
        SeS.DeleteSellService(drugname, changshang, pihao, amount);
        return "redirect:/sell_user";
    }

    //queryselldruginfo
    @RequestMapping("/queryselldruginfo_user")
    public String to_queryselldruginfo(String querydrug, Map<String, Object> map) {
        map.put("forSS", SeS.ForSellSelectService(querydrug));
        return "sell/sellselect_user";
    }

    //toaddsellamount
    @RequestMapping(value = "/toaddsellamount_user", method = RequestMethod.POST)
    public String to_toaddsellamount(String drugname, String changshang, String pihao, Map<String, Object> map) {
        map.put("foraddamount", SeS.QueryDCPinStoreService(drugname, changshang, pihao));
        return "sell/sellamount_user";
    }

    //addsellamount
    @RequestMapping(value = "/addsellamount_user", method = RequestMethod.POST)
    public String to_addsellamount(String drugname, String changshang, String pihao, String amount) {
        SeS.ProSellService(drugname, changshang, pihao, amount);
        return "redirect:/sell_user";
    }

    //sellit
    @RequestMapping(value = "/sellit_user")
    public String to_sellit(Map<String, Object> map) {
        List<Rxdrug> check = SeS.SellitService();
        if (check == null) {
            return "redirect:/sell_user";
        } else {
            map.put("rxinfo", check);
            map.put("rxcount", SeS.RxCountService());
            return "sell/sell_user";
        }
    }

    //printsell
    @RequestMapping(value = "/printsell_user")
    public String to_printsell() {
        SeS.PrintService();
        return "redirect:/sell_user";
    }

    //
    //addrxperson
    @RequestMapping(value = "/addrxperson_user")
    public String to_addRxperson(Rxperson Rx, Map<String, Object> map) {
        map.put("msg", SeS.AddRxPersonService(Rx));
        return "sell/sell_user";
    }


    //rx

    @RequestMapping("/rx_user")  //rx
    public String to_rx(Map<String, Object> map) {
        map.put("timeinfo", RS.GetOverTime());
        return "rx/rx_user";
    }

    @RequestMapping(value = "/addprx_user")
    public String to_addRxperson_(Rxperson Rx, Map<String, Object> map) {
        RS.AddRxPService(Rx);
        map.put("timeinfo", RS.GetOverTime());
        return "rx/rx_user";
    }

    @RequestMapping(value = "/rxinfo_user")
    public String to_rxinfo(Rxperson Rx, Map<String, Object> map) {
        map.put("rxallinfo", RS.GetCompleteInfoService());
        return "rx/rxinfo_user";
    }

    //queryrx
    @RequestMapping(value = "/queryrx_user")
    public String to_queryrx(String queryrx, Map<String, Object> map) {
        map.put("rxallinfo", RS.QueryRxService(queryrx));
        return "rx/rxinfo_user";
    }

    @ResponseBody
    @RequestMapping(value = "/getrxtime_user")
    public Rxperson to_getrxtime(String time) {
        return RS.GetTimeRxpService(time);
    }

    //updaterxp
    @RequestMapping(value = "/updaterxp_user")
    public String to_updaterxp(Rxperson Rx, Map<String, Object> map) {
        RS.UpdateRxService(Rx);
        map.put("rxallinfo", RS.GetCompleteInfoService());
        return "rx/rxinfo_user";
    }

    //delrxinfo
    @RequestMapping(value = "/delrxinfo_user")
    public String to_delrxinfo(String del, Map<String, Object> map) {
        RS.DelRxService(del);
        map.put("rxallinfo", RS.GetCompleteInfoService());
        return "rx/rxinfo_user";
    }


}
