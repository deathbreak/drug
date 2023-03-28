package com.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Rxperson;
import com.service.RxService;

@Controller
public class RxController {

    @Autowired
    RxService RS;


    @RequestMapping("/rx")  //rx
    public String to_rx(Map<String, Object> map) {
        map.put("timeinfo", RS.GetOverTime());
        return "rx/rx";
    }

    @RequestMapping(value = "/addprx")
    public String to_addRxperson(Rxperson Rx, Map<String, Object> map) {
        RS.AddRxPService(Rx);
        map.put("timeinfo", RS.GetOverTime());
        return "rx/rx";
    }

    @RequestMapping(value = "/rxinfo")
    public String to_rxinfo(Rxperson Rx, Map<String, Object> map) {
        map.put("rxallinfo", RS.GetCompleteInfoService());
        return "rx/rxinfo";
    }

    //queryrx
    @RequestMapping(value = "/queryrx")
    public String to_queryrx(String queryrx, Map<String, Object> map) {
        map.put("rxallinfo", RS.QueryRxService(queryrx));
        return "rx/rxinfo";
    }

    @ResponseBody
    @RequestMapping(value = "/getrxtime")
    public Rxperson to_getrxtime(String time) {
        return RS.GetTimeRxpService(time);
    }

    //updaterxp
    @RequestMapping(value = "/updaterxp")
    public String to_updaterxp(Rxperson Rx, Map<String, Object> map) {
        RS.UpdateRxService(Rx);
        map.put("rxallinfo", RS.GetCompleteInfoService());
        return "rx/rxinfo";
    }

    //delrxinfo
    @RequestMapping(value = "/delrxinfo")
    public String to_delrxinfo(String del, Map<String, Object> map) {
        RS.DelRxService(del);
        map.put("rxallinfo", RS.GetCompleteInfoService());
        return "rx/rxinfo";
    }
}
