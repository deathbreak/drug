package com.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.Rxdrug;
import com.bean.Rxperson;
import com.service.SellService;


@Controller
public class SellController {

    @Autowired
    SellService SeS;

    @RequestMapping("/sell")  //sell
    public String to_sell(Map<String, Object> map) {
        map.put("sellinfo", SeS.GetAllSellService());
        return "sell/sell";
    }

    //deletesell
    @RequestMapping(value = "/deletesell", method = RequestMethod.POST)  //deletejinhuo
    public String to_deletesell(String drugname, String changshang,
                                String pihao, String amount) {
        SeS.DeleteSellService(drugname, changshang, pihao, amount);
        return "redirect:/sell";
    }

    //queryselldruginfo
    @RequestMapping("/queryselldruginfo")
    public String to_queryselldruginfo(String querydrug, Map<String, Object> map) {
        map.put("forSS", SeS.ForSellSelectService(querydrug));
        return "sell/sellselect";
    }

    //toaddsellamount
    @RequestMapping(value = "/toaddsellamount", method = RequestMethod.POST)
    public String to_toaddsellamount(String drugname, String changshang, String pihao, Map<String, Object> map) {
        map.put("foraddamount", SeS.QueryDCPinStoreService(drugname, changshang, pihao));
        return "sell/sellamount";
    }

    //addsellamount
    @RequestMapping(value = "/addsellamount", method = RequestMethod.POST)
    public String to_addsellamount(String drugname, String changshang, String pihao, String amount) {
        SeS.ProSellService(drugname, changshang, pihao, amount);
        return "redirect:/sell";
    }

    //sellit
    @RequestMapping(value = "/sellit")
    public String to_sellit(Map<String, Object> map) {
        List<Rxdrug> check = SeS.SellitService();
        if (check == null) {
            return "redirect:/sell";
        } else {
            map.put("rxinfo", check);
            map.put("rxcount", SeS.RxCountService());
            return "sell/sell";
        }
    }

    //printsell
    @RequestMapping(value = "/printsell")
    public String to_printsell() {
        SeS.PrintService();
        return "redirect:/sell";
    }

    //
    //addrxperson
    @RequestMapping(value = "/addrxperson")
    public String to_addRxperson(Rxperson Rx, Map<String, Object> map) {
        map.put("msg", SeS.AddRxPersonService(Rx));
        return "sell/sell";
    }
}









