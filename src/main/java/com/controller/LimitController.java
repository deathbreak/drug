package com.controller;

import com.bean.Limitsell;
import com.bean.ResponseResult;
import com.mapper.LimitsellMapper;
import com.service.SellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LimitController {

    @Autowired
    SellService ss;

    @Autowired
    LimitsellMapper lm;

    @RequestMapping("/limitinfo")  //limitinfo
    public String to_limitinfo() {
        return "tostore/limitinfo";
    }

    //addlimit
    @ResponseBody
    @RequestMapping(value = "/addlimit", method = RequestMethod.POST)
    public ResponseResult to_addlimit(String drugname, String changshang, int amount) {
        Limitsell limitsell = new Limitsell(drugname, changshang, amount);
        int check = lm.CountLimit(drugname, changshang);
        if (check > 0 || null == limitsell) {
            return new ResponseResult(202, "error");
        }

        lm.AddLimit(limitsell);
        return new ResponseResult(200, "添加成功");
    }

    //getlimitinfo
    @ResponseBody
    @RequestMapping(value = "/getlimitinfo", method = RequestMethod.POST)
    public ResponseResult to_getlimitinfo() {
        return ss.CheckLimit();
    }

    //getlimitinfo_clerk
    @ResponseBody
    @RequestMapping(value = "/getlimitinfo_clerk", method = RequestMethod.POST)
    public ResponseResult getlimitinfo_clerk() {
        return ss.CheckLimit();
    }

    //dellimitinfo
    @ResponseBody
    @RequestMapping(value = "/dellimit", method = RequestMethod.POST)
    public ResponseResult to_dellimitinfo(String drugname, String changshang) {
        lm.DelLimit(drugname, changshang);
        return new ResponseResult(200, lm.GetAllLimit());
    }


    @ResponseBody
    @RequestMapping(value = "/Alllimit", method = RequestMethod.POST)
    public ResponseResult all_limit_info() {
        return new ResponseResult(200, lm.GetAllLimit());
    }
}
