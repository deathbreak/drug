package com.controller;

import java.util.Map;


import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Drug;
import com.service.DruginfoService;


@Controller
public class DruginfoController {
    @Autowired
    DruginfoService DS;

    @RequestMapping("/main")
    public String redirect_to_main() {
        return "main";
    }

    //querydrug
    @RequestMapping("/querydrug")   //这个方法还需要优化，耗性能，前端可以使用JSON来平衡性能
    public String to_querydrug(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                               @RequestParam(value = "querydrug") String qd, Map<String, Object> map) {
        map.put("queryresult", DS.QueryDrugService(pn, qd));
        map.put("querystring", qd);
        return "druginfo/querydrug";
    }

    @RequestMapping("/querydrug2")   //这个方法还需要优化，耗性能，前端可以使用JSON来平衡性能
    public String to_querydrug2(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                                @RequestParam(value = "querydrug") String qd,
                                Map<String, Object> map) {
        map.put("queryresult", DS.QueryDrugService(pn, qd));
        map.put("querystring", qd);
        return "druginfo/druginfo";
    }

    /**
     * 药品基础信息修改
     *
     * @param hs
     * @param pn
     * @param nowqd
     * @param olddn
     * @param oldcs
     * @param reqdrug
     * @param map
     * @return
     */
    @RequestMapping(value = "/updatedrug", method = RequestMethod.POST)
    public String to_update(@RequestParam(value = "nowpage", defaultValue = "1") Integer pn,
                            String nowqd, String olddn, String oldcs, @Valid Drug reqdrug, Map<String, Object> map) {
        if (DS.UpdateDrugService(olddn, oldcs, reqdrug)) {
            map.put("queryresult", DS.QueryDrugService(pn, nowqd));
            map.put("querystring", nowqd);
            map.put("msg", "修改成功！");
            return "druginfo/querydrug";
        } else {
            map.put("queryresult", DS.QueryDrugService(pn, nowqd));
            map.put("querystring", nowqd);
            map.put("msg", "修改失败,要修改的名称不可用,数据库中已存在同名药品!");
            return "druginfo/querydrug";
        }
    }

    //这个可以优化一下，和上面那个方法写成一个
    @RequestMapping(value = "/updatedrug2", method = RequestMethod.POST)
    public String to_update2(@RequestParam(value = "nowpage", defaultValue = "1") Integer pn,
                             String nowqd, String olddn, String oldcs, @Valid Drug reqdrug, Map<String, Object> map) {
        if (DS.UpdateDrugService(olddn, oldcs, reqdrug)) {
            map.put("queryresult", DS.QueryDrugService(pn, nowqd));
            map.put("querystring", nowqd);
            map.put("msg", "修改成功！");
            return "druginfo/druginfo";
        } else {
            map.put("queryresult", DS.QueryDrugService(pn, nowqd));
            map.put("querystring", nowqd);
            map.put("msg", "修改失败,要修改的名称不可用,数据库中已存在同名药品!");
            return "druginfo/druginfo";
        }
    }

    @RequestMapping("/druginfo")
    public String to_druginfo(Map<String, Object> map) {
        map.put("queryresult", DS.QueryDrugService(1, ""));
        map.put("querystring", "");
        return "druginfo/druginfo";
    }

    @RequestMapping("/adddrug")
    public String to_adddrug() {
        return "druginfo/adddrug";
    }

    //add
    @RequestMapping(value = "/adddrugval", method = RequestMethod.POST)
    public String to_adddrugval(@Valid Drug adddrug, Map<String, Object> map) {
        if (DS.AddService(adddrug)) {
            map.put("msg", "添加成功");
            return "druginfo/adddrug";
        } else {
            map.put("msg", "添加失败,要添加的名称不可用,数据库中已存在同名药品,请稍微修改一下重试");
            map.put("olddrug", adddrug);
            return "druginfo/adddrug";
        }
    }

    @RequestMapping(value = "/deletedrug", method = RequestMethod.POST)
    public String to_delete(String pn, String qd, String drugname, String changshang,
                            RedirectAttributes attr) {
        DS.DeleteService(drugname, changshang);
        attr.addAttribute("pn", pn);
        attr.addAttribute("querydrug", qd);
        return "redirect:/querydrug";
    }

    @RequestMapping(value = "/deletedrug2", method = RequestMethod.POST)
    public String to_delete2(String pn, String qd, String drugname, String changshang,
                             RedirectAttributes attr) {
        DS.DeleteService(drugname, changshang);
        attr.addAttribute("pn", pn);
        attr.addAttribute("querydrug", qd);
        return "redirect:/querydrug2";
    }

}