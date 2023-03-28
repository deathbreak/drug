package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Drug;


@Repository
public interface DrugMapper {
		List<Drug> QueryByNameCS(@Param("drugname")String drugname,@Param("changshang")String changshang);  //根据drugname和changshang查找
		void AddDrug(Drug drug); //添加drug
		void DeleteDrug(@Param("drugname")String drugname,@Param("changshang")String changshang);//根据drugname和changshang删除drug
		List<Drug> GetAllDrug();//查询全部druginfo
		List<Drug> QueryByTiao(String tiaoxingma); //根据条形码查询drug
		List<Drug> QueryByName(String name);  //根据drugname模糊查询
		void Update(@Param("olddn")String olddn,@Param("oldcs")String oldcs,@Param("dd")Drug drug);
}
