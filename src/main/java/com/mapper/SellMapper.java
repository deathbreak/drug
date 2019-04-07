package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Sell;
import com.bean.Sellover;
import com.bean.Sellrecords;


@Repository
public interface SellMapper {
	void DeleteSellByDCPA(@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao,@Param("amount")String amount);
	List<Sell> GetAllSell();
	List<Sell> QuerySellByDCP(@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao);
	void AddSell(Sell sell);
	void UpdateSellCountSum(@Param("amount")String amount,@Param("sum")String sum,@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao);
	void DelTableSell();
	///Sellrecords
	void AddSellrecords(Sellrecords sellrecords);
	List<Sellrecords> GetAllSellrecords();
	List<Sellrecords> GetRecordsByST(String selltime);
	void DeleteSellrecords(@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao,@Param("selltime")String selltime);
	//Sellover
	void AddSellover(Sellover sellover);
	List<Sellover> GetAllSellover();
	void DelSellover(@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao);
}
