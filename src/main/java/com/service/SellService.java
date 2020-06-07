package com.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Rxdrug;
import com.bean.Rxperson;
import com.bean.Sell;
import com.bean.Sellover;
import com.bean.Sellrecords;
import com.bean.Store;
import com.mapper.RxdrugMapper;
import com.mapper.RxpersonMapper;
import com.mapper.SellMapper;
import com.mapper.StoreMapper;
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
	public List<Sell> GetAllSellService(){
		return sell.GetAllSell();
	}

	public void DeleteSellService(String drugname, String changshang,
			String pihao, String amount) {
		sell.DeleteSellByDCPA(drugname, changshang, pihao, amount);
		
	}

	public List<Store> ForSellSelectService(String qd) {
		if(qd==""||qd==null){
			List<Store> re = store.GetAllStore();
			return re;
		}else{
			if(Boolean_tiaoxingma.CheckParam(qd)){
				List<Store> re2 = store.QueryBySTiao(qd);
				return re2;
			}else{
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
			
			if(!sssss.isEmpty()){
				Store xs = sssss.get(0);
				List<Sell> checksell = sell.QuerySellByDCP(drugname, changshang, pihao);
				int flag = checksell.size();
				if(flag<=0){
					String sum = "";
					sum=StringPro.mul(xs.getPrice(),amount);
					Sell as = new Sell(xs.getDrugname(),xs.getChangshang(),xs.getPrice(), xs.getDate(),xs.getPihao(),xs.getBeizhu(), xs.getCount(), xs.getUnit(), xs.getGuige(), amount, sum);
					sell.AddSell(as);
				}else{
					Sell dd = checksell.get(0);
					String newamount=StringPro.add(dd.getAmount(),amount);
                    String sum2=StringPro.mul(newamount,dd.getPrice());
                    sell.UpdateSellCountSum(newamount, sum2, drugname, changshang, pihao);
				}
			}
			
	}

	public List<Rxdrug> SellitService() {
		List<Sell> updatesell = sell.GetAllSell();
		if(!updatesell.isEmpty()){
			
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String date2=df.format(new Date());
            List<Rxdrug> CheckRxdrug = new ArrayList<Rxdrug>();
			for (Sell udsell : updatesell) {
				
				if(udsell.getBeizhu().equals("处方药")) {
					Rxdrug rd = new Rxdrug(date2,udsell.getDrugname(),udsell.getChangshang(),udsell.getDate(),udsell.getPihao(),udsell.getAmount());
					rdm.AddRxdrug(rd);
					CheckRxdrug.add(rd);
				}
				
				sell.AddSellrecords(new Sellrecords(udsell.getDrugname(), udsell.getChangshang(), udsell.getPrice(), udsell.getDate(), udsell.getPihao(), udsell.getBeizhu(), udsell.getUnit(), udsell.getGuige(), udsell.getAmount(), udsell.getSum(), date2));
				String newcount=StringPro.sub(udsell.getCount(),udsell.getAmount());
				store.UpdateStoreCount(newcount, udsell.getDrugname(), udsell.getChangshang(), udsell.getPihao());
				if(newcount.equals("0")){
					sell.AddSellover(new Sellover(udsell.getDrugname(), udsell.getChangshang(), udsell.getPrice(), udsell.getDate(), udsell.getPihao(), udsell.getBeizhu(), newcount, udsell.getUnit(), udsell.getGuige()));
                    store.DeleteCountZero();
                }
			}
			sell.DelTableSell();
			if(CheckRxdrug.size()>0) {
				return CheckRxdrug;
			}else {
				return null;
			}
			
		}else {
			return null;
		}
	}

	public void PrintService() {
		List<Sell> check = sell.GetAllSell();
		if(!check.isEmpty()){
			Print p=new Print();
			String sum="0";
			for (int a=check.size()-1;a>=0;a--) {
				Sell ff=(Sell)check.get(a);
                sum=StringPro.add(sum,ff.getSum());
			}
			p.printSheet("0001","xxx药店","张三",sum,"现金","普通会员","7xxxxx3","xxx大桥边",check);
		}
	}
	//倒序输出结果
	public List<Sellrecords> GetRecordsService(String selltime){
		if(selltime.equals("")||selltime==null){
			List<Sellrecords> re = sell.GetAllSellrecords();
			Collections.reverse(re);
			return re;
		}else{
			return sell.GetRecordsByST(selltime);
		}
	}

	public void DelRecordsService(String drugname, String changshang,
			String pihao, String selltime) {
		sell.DeleteSellrecords(drugname, changshang, pihao, selltime);
		
	}
	public List<Sellover> GetASService(){
		return sell.GetAllSellover();
	}

	public void DelSelloverService(String drugname, String changshang,
			String pihao) {
		sell.DelSellover(drugname, changshang, pihao);
	}
	/**
	 * 
	 * @return 未记录的处方药条数
	 */
	public Integer RxCountService() {
		return rdm.CountNullRx();
	}

	public String AddRxPersonService(Rxperson rx) {
			List<Rxperson> check = rpm.GetByTime(rx.getTime());
			if(check.size()==0) {
				rpm.AddRxperson(rx);
				return "添加处方药信息成功";
			}else {
				return "添加失败,已经添加了这个处方药信息";
			}
	}
}













