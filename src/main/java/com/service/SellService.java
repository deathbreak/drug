package com.service;

import java.text.SimpleDateFormat;
import java.util.*;

import com.bean.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utils.*;


@Service
public class SellService {

    @Autowired
    SellMapper sell;

    @Autowired
    StoreMapper store;

    @Autowired
    RxdrugMapper rdm;

    @Autowired
    RxpersonMapper rpm;

    @Autowired
    LimitsellMapper lm;

    public List<Sell> GetAllSellService() {
        return sell.GetAllSell();
    }

    public void DeleteSellService(String drugname, String changshang,
                                  String pihao, String amount) {
        sell.DeleteSellByDCPA(drugname, changshang, pihao, amount);

    }

    public List<Store> ForSellSelectService(String qd) {
        if (qd == "" || qd == null) {
            List<Store> re = store.GetAllStore();
            return re;
        } else {
            if (Boolean_tiaoxingma.CheckParam(qd)) {
                List<Store> re2 = store.QueryBySTiao(qd);
                return re2;
            } else {
                List<Store> re3 = store.QueryBySName(qd);
                return re3;
            }
        }
    }

    public List<Store> QueryDCPinStoreService(String drugname, String changshang,
                                              String pihao) {
        return store.QueryByNCP(drugname, changshang, pihao);
    }

    public void ProSellService(String drugname, String changshang,
                               String pihao, String amount) {

        List<Store> sssss = store.QueryByNCP(drugname, changshang, pihao);

        if (null != sssss && !sssss.isEmpty()) {
            Store xs = sssss.get(0);
            List<Sell> checksell = sell.QuerySellByDCP(drugname, changshang, pihao);
            int flag = checksell.size();
            if (flag <= 0) {
                String sum = "";
                sum = StringPro.mul(xs.getPrice(), amount);
                Sell as = new Sell(xs.getDrugname(), xs.getChangshang(), xs.getPrice(), xs.getDate(), xs.getPihao(), xs.getBeizhu(), xs.getCount(), xs.getUnit(), xs.getGuige(), amount, sum);
                sell.AddSell(as);
            } else {
                Sell dd = checksell.get(0);
                String newamount = StringPro.add(dd.getAmount(), amount);
                String sum2 = StringPro.mul(newamount, dd.getPrice());
                sell.UpdateSellCountSum(newamount, sum2, drugname, changshang, pihao);
            }
        }

    }

    public ResponseResult CheckLimit() {
        List<Sell> sell_info = sell.GetAllSell();
        String re = "";
        for (Sell sell : sell_info) {
            Integer temp = lm.QueryLimit(sell.getDrugname(), sell.getChangshang());
            int flag = (temp == null ? 0 : temp);
            if (flag > 0 && flag < Integer.parseInt(sell.getAmount())) {
                re = re + "药品名:" + sell.getDrugname() + ",生产厂商:" + sell.getChangshang() + ",限购:" + flag + ";";
            }
        }
        if ("".equals(re)) {
            return new ResponseResult(200, "is ok");
        }
        return new ResponseResult(202, re);
    }

    public List<Rxdrug> SellitService() {
        List<Sell> updatesell = sell.GetAllSell();
        if (null != updatesell && !updatesell.isEmpty()) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String date2 = df.format(new Date());
            List<Rxdrug> CheckRxdrug = new ArrayList<Rxdrug>();
            for (Sell udsell : updatesell) {
                if (udsell.getBeizhu().equals("处方药")) {
                    Rxdrug rd = new Rxdrug(date2, udsell.getDrugname(), udsell.getChangshang(), udsell.getDate(), udsell.getPihao(), udsell.getAmount());
                    rdm.AddRxdrug(rd);
                    CheckRxdrug.add(rd);
                }
                String bp = store.QueryBpByNCP(udsell.getDrugname(), udsell.getChangshang(), udsell.getPihao());
                sell.AddSellrecords(new Sellrecords(udsell.getDrugname(), udsell.getChangshang(), bp, udsell.getPrice(), udsell.getDate(), udsell.getPihao(), udsell.getBeizhu(), udsell.getUnit(), udsell.getGuige(), udsell.getAmount(), udsell.getSum(), date2));
                String newcount = StringPro.sub(udsell.getCount(), udsell.getAmount());
                store.UpdateStoreCount(newcount, udsell.getDrugname(), udsell.getChangshang(), udsell.getPihao());
                if (newcount.equals("0")) {
                    sell.AddSellover(new Sellover(udsell.getDrugname(), udsell.getChangshang(), udsell.getPrice(), date2, udsell.getPihao(), udsell.getBeizhu(), newcount, udsell.getUnit(), udsell.getGuige()));
                    store.DeleteCountZero();
                }
            }
            sell.DelTableSell();
            if (CheckRxdrug.size() > 0) {
                return CheckRxdrug;
            } else {
                return null;
            }

        } else {
            return null;
        }
    }

    public void PrintService() {
        List<Sell> check = sell.GetAllSell();
        if (!check.isEmpty()) {
            Print p = new Print();
            String sum = "0";
            for (int a = check.size() - 1; a >= 0; a--) {
                Sell ff = (Sell) check.get(a);
                sum = StringPro.add(sum, ff.getSum());
            }
            p.printSheet("0001", "xxx药店", "张三", sum, "现金", "普通会员", "7xxxxx3", "xxx大桥边", check);
        }
    }

    //	//倒序输出结果
//	public List<Sellrecords> GetRecordsService(String selltime){
//		if(selltime.equals("")||selltime==null){
//			List<Sellrecords> re = sell.GetAllSellrecords();
//			Collections.reverse(re);
//			return re;
//		}else{
//			return sell.GetRecordsByST(selltime);
//		}
//	}
    //update this function
    public PageInfo<Sellrecords> GetRecordsService(Integer pn, String selltime) {
        if (selltime.equals("nowtime")) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            selltime = sdf.format(new Date());//获取系统当前时间
        }

        if (selltime.equals("") || selltime == null) {
            PageHelper.startPage(pn, 8);
            List<Sellrecords> re = sell.GetAllSellrecords();
            Collections.reverse(re);
            PageInfo<Sellrecords> page_1 = new PageInfo<Sellrecords>(re, 5);
            return page_1;
        } else {
            PageHelper.startPage(pn, 8);
            List<Sellrecords> re2 = sell.GetRecordsByST(selltime);
            Collections.reverse(re2);
            PageInfo<Sellrecords> page_2 = new PageInfo<Sellrecords>(re2, 5);
            return page_2;
        }
    }

    //time
    public String GetTimeInfo(String selltime) {
        if (selltime.equals("nowtime")) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(new Date());
        } else {
            return selltime;
        }
    }

    //算净利润
    public String GetMoneyInfo(String selltime) {
        if (selltime.equals("nowtime")) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            selltime = sdf.format(new Date());//获取系统当前时间
        }
        if (selltime.equals("") || selltime == null) {
            List<Sellrecords> re = sell.GetAllSellrecords();
            return ReturnSum(re);
        } else {
            List<Sellrecords> re2 = sell.GetRecordsByST(selltime);
            return ReturnSum(re2);
        }
    }

    public String ReturnSum(List<Sellrecords> re) {
        String sum = "0";
        for (Sellrecords sellrecords : re) {
            if (sellrecords.getBeginprice() == null || sellrecords.getBeginprice().equals("")) {
                sellrecords.setBeginprice("0");
            }
            sum = StringPro.add(sum, StringPro.mul(sellrecords.getAmount(), StringPro.sub(sellrecords.getPrice(), sellrecords.getBeginprice())));
        }
        return sum;
    }

    public void DelRecordsService(String drugname, String changshang,
                                  String pihao, String selltime) {
        sell.DeleteSellrecords(drugname, changshang, pihao, selltime);

    }

    public List<Sellover> GetASService() {
        return sell.GetAllSellover();
    }

    public void DelSelloverService(String drugname, String changshang,
                                   String pihao) {
        sell.DelSellover(drugname, changshang, pihao);
    }

    /**
     * @return 未记录的处方药条数
     */
    public Integer RxCountService() {
        return rdm.CountNullRx();
    }

    public String AddRxPersonService(Rxperson rx) {
        List<Rxperson> check = rpm.GetByTime(rx.getTime());
        if (check.size() == 0) {
            rpm.AddRxperson(rx);
            return "添加处方药信息成功";
        } else {
            return "添加失败,已经添加了这个处方药信息";
        }
    }
}













