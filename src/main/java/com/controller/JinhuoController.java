package com.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Drug;
import com.bean.Gonghuoshang;
import com.bean.Jinhuo;
import com.bean.Msg;
import com.service.JinhuoService;


@Controller
public class JinhuoController {

    @Autowired
    JinhuoService JS;

    @RequestMapping("/tostore")  //jinhuo
    public String to_tostore(Map<String, Object> map) {
        map.put("jinhuo", JS.GetAllJinhuoService());
        return "tostore/tostore";
    }

    @RequestMapping("/jhrecords")  //jhrecords查看进货记录
    public String to_jhrecords(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                               @RequestParam(value = "querydrug", defaultValue = "") String qd, Map<String, Object> map) {
        map.put("queryresult", JS.QueryJFYService(pn, qd));
        map.put("querystring", qd);
        map.put("ghsinfo", JS.GetAllGhsService());
        return "tostore/jhrecords";
    }

    @RequestMapping("/ghsinfo")  //ghsinfo
    public String to_ghsinfo() {
        return "tostore/ghsinfo";
    }

    @RequestMapping(value = "/deletejinhuo", method = RequestMethod.POST)  //deletejinhuo
    public String to_deletejinhuo(String drugname, String changshang,
                                  String pihao, String amount) {
        JS.DeleteJinhuoService(drugname, changshang, pihao, amount);
        return "redirect:/tostore";
    }

    //cpsh
    @RequestMapping("/cpsh")
    public String to_cpsh() {
        JS.CpshService();
        return "redirect:/tostore";
    }

    //queryjhdruginfo
    @RequestMapping("/queryjhdruginfo")
    public String to_queryjhdruginfo(String querydrug, Map<String, Object> map) {
        map.put("forselect", JS.ForSelectService(querydrug));
        return "tostore/jinhuoselect";
    }

    //toaddjinhuo
    @RequestMapping("/toaddjinhuo")
    public String to_toaddjinhuo(@Valid Drug drug, Map<String, Object> map) {
        map.put("druginfo", drug);
        map.put("ghsinfo", JS.GetAllGhsService());
        return "tostore/toaddjinhuo";
    }

    //addjinhuo
    @RequestMapping("/addjinhuo")
    public String to_addjinhuo(@Valid Jinhuo j) {
        JS.AddJinhuoService(j);
        return "redirect:/tostore";
    }

    //getghsinfo
    @ResponseBody
    @RequestMapping(value = "/getghsinfo", method = RequestMethod.POST)
    public List<Gonghuoshang> to_getghsinfo() {
        return JS.GetAllGhsService();
    }

    //delghsinfo
    @ResponseBody
    @RequestMapping(value = "/delghsinfo", method = RequestMethod.POST)
    public Msg to_delghsinfo(String delargs) {
        return JS.DelGhsCheckService(delargs);
    }

    //delghs-records
    @RequestMapping("/delghs-records")
    public String to_delghs_records(String confirmdel) {
        JS.DelGhsAndRecordsService(confirmdel);
        return "redirect:/ghsinfo";
    }

    //addghsinfo
    @ResponseBody
    @RequestMapping(value = "/addghsinfo", method = RequestMethod.POST)
    public Msg to_addghsinfo(String addval) {
        if (!addval.equals("")) {
            return JS.AddGhsService(addval);
        }
        return null;
    }
}













