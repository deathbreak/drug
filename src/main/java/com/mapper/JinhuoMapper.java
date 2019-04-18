package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Jinhuo;

@Repository
public interface JinhuoMapper {
		List<Jinhuo> GetAllJinhuo();
		void DelTableJinhuo();
		void DelJinhuo(@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao,@Param("amount")String amount);
		void AddJinhuo(Jinhuo jh);
		////////////////////////
		void AddJinhuorecords(Jinhuo j);
		int CountGhsRecords(String gonghuoshang);
		void DelJinhuoRecords(String gonghuoshang);
		List<Jinhuo> GAJRecords();
		List<Jinhuo> GJRGHS(String ghs);
}
