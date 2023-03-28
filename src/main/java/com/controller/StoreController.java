package com.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Drug;
import com.bean.Store;
import com.service.DruginfoService;
import com.service.StoreService;


@Controller
public class StoreController {
    @Autowired
    StoreService SS;

    @Autowired
    DruginfoService DS2;

    @RequestMapping("/store")  //store
    public String to_store() {
        return "store/store";
    }

    @RequestMapping("/storeinfo")
    public String to_storeinfo(Map<String, Object> map) {
        map.put("queryresult", SS.QueryStoreService(1, ""));
        map.put("querystring", "");
        return "store/storeinfo";
    }

    @RequestMapping("/addstore")  //storeinfo
    public String to_addstore() {
        return "store/addstore";
    }

    @RequestMapping("/querystore")  //storeinfo
    public String to_querystore(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                                @RequestParam(value = "querystore") String qd,
                                Map<String, Object> map) {
        map.put("queryresult", SS.QueryStoreService(pn, qd));
        map.put("querystring", qd);
        return "store/querystore";
    }

    @RequestMapping("/querystore2")   //这个方法还需要优化，耗性能，前端可以使用JSON来平衡性能
    public String to_querystore2(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                                 @RequestParam(value = "querystore") String qd,
                                 Map<String, Object> map) {
        map.put("queryresult", SS.QueryStoreService(pn, qd));
        map.put("querystring", qd);
        return "store/storeinfo";
    }

    @RequestMapping(value = "/deletestore", method = RequestMethod.POST)
    public String to_deletestore(String pn, String qd, String drugname, String changshang,
                                 String pihao, RedirectAttributes attr) {

        SS.DeleteService(drugname, changshang, pihao);
        attr.addAttribute("pn", pn);
        attr.addAttribute("querystore", qd);
        return "redirect:/querystore";
    }

    @RequestMapping(value = "/deletestore2", method = RequestMethod.POST)
    public String to_deletestore2(String pn, String qd, String drugname, String changshang,
                                  String pihao, RedirectAttributes attr) {
        SS.DeleteService(drugname, changshang, pihao);
        attr.addAttribute("pn", pn);
        attr.addAttribute("querystore", qd);
        return "redirect:/querystore2";
    }


    @RequestMapping(value = "/updatestore", method = RequestMethod.POST)
    public String to_updatestore(@RequestParam(value = "nowpage", defaultValue = "1") Integer pn,
                                 String nowqd, Map<String, Object> map, @Valid Store reqstore, BindingResult result) {
        if (result.hasErrors()) {
            map.put("queryresult", SS.QueryStoreService(pn, nowqd));
            map.put("querystring", nowqd);
            map.put("msg", "修改失败:时间格式有误,生产日期需要是过去的时间,有效期需要是将来的时间");
            return "store/querystore";
			/*	List<FieldError> err = result.getFieldErrors();
				if(err.size()==1){
					map.put("msg", "修改失败:"+err.get(0).getField()+err.get(0).getDefaultMessage());
					return "store/querystore";
				}else{
					map.put("msg", "修改失败:"+err.get(0).getField()+err.get(0).getDefaultMessage()+
							","+err.get(1).getField()+err.get(1).getDefaultMessage());
					return "store/querystore";
				}    */
        } else {
            SS.UpdateStoreService(reqstore);
            map.put("queryresult", SS.QueryStoreService(pn, nowqd));
            map.put("querystring", nowqd);
            map.put("msg", "修改成功！");
            return "store/querystore";
        }
    }

    @RequestMapping(value = "/updatestore2", method = RequestMethod.POST)
    public String to_updatestore2(@RequestParam(value = "nowpage", defaultValue = "1") Integer pn,
                                  String nowqd, Map<String, Object> map, @Valid Store reqstore, BindingResult result) {
        if (result.hasErrors()) {
            map.put("queryresult", SS.QueryStoreService(pn, nowqd));
            map.put("querystring", nowqd);
            map.put("msg", "修改失败:时间格式有误,生产日期需要是过去的时间,有效期需要是将来的时间");
            return "store/storeinfo";
        } else {
            SS.UpdateStoreService(reqstore);
            map.put("queryresult", SS.QueryStoreService(pn, nowqd));
            map.put("querystring", nowqd);
            map.put("msg", "修改成功！");
            return "store/storeinfo";
        }
    }

    /* @ResponseBody
     @RequestMapping(value="/updatestore2",method=RequestMethod.POST)
     public List<FieldError> to_updatestore2(@RequestParam(value="nowpage",defaultValue="1")Integer pn,
             String nowqd,@Valid Store reqstore,BindingResult result){

             if(result.hasErrors()){

                 List<FieldError> err = result.getFieldErrors();

                 return err;
             }return null;
     }*/
    @RequestMapping("/selectdrug")  //store
    public String to_selectdrug(String queryselectdrug, Map<String, Object> map) {
        map.put("selectinfo", DS2.QueryDrugService(queryselectdrug));
        return "store/selectpage";
    }

    /*
    <td>
    <a class="btn btn-info btn-sm" href="<%=basePath%>toaddstore?drugname=${ds.drugname }&changshang=${ds.changshang }&beizhu=${ds.beizhu }&location=${ds.location }&unit=${ds.unit }&guige=${ds.guige }&tiaoxingma=${ds.tiaoxingma }" role="button">
        <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>选择添加此药品
    </a>
</td>*/
    @RequestMapping(value = "/toaddstore", method = RequestMethod.POST)
    public String toaddstore(@Valid Drug drug, Map<String, Object> map) {
        map.put("drugstoreinfo", drug);
        return "store/addstoreinfo";
    }

    //addtostore
    @RequestMapping(value = "/addtostore", method = RequestMethod.POST)
    public String to_addtostore(Map<String, Object> map, @Valid Store store, BindingResult result) {
        if (result.hasErrors()) {
            Drug dd = new Drug(store.getDrugname(), store.getChangshang(), store.getBeizhu(), store.getLocation(), store.getUnit(), store.getGuige(), store.getTiaoxingma());
            map.put("msg", "修改失败:时间格式有误,生产日期需要是过去的时间,有效期需要是将来的时间");
            map.put("drugstoreinfo", dd);
            return "store/addstoreinfo";
        } else {
            if (SS.AddStoreService(store)) {
                map.put("msg", "已有同批号药品，添加成功");
                return "store/addstore";
            } else {
                map.put("msg", "添加成功");
                return "store/addstore";
            }
        }
    }

    //deletetip
    @RequestMapping(value = "/deletetip", method = RequestMethod.POST)
    public String to_deletetip(String drugname, String changshang,
                               String pihao) {
        SS.DeleteService(drugname, changshang, pihao);
        return "redirect:/date";
    }
}
