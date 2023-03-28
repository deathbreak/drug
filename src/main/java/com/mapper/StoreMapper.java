package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Store;


@Repository
public interface StoreMapper {
	List<Store> QueryByNCP(@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao);//根据name,changshang,pihao查询
	String QueryBpByNCP(@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao);//根据name,changshang,pihao查询beginprice
	void AddStore(Store store);
	void UpdateStoreCount(@Param("count")String count,@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao);
	void DeleteStore(@Param("drugname")String drugname,@Param("changshang")String changshang,@Param("pihao")String pihao);
	List<Store> GetAllStore();
	List<Store> QueryBySTiao(String tiao);
	List<Store> QueryBySName(String name);  //根据drugname模糊查询
	/**
	 * 用于缺货信息那边
	 */
	void DeleteCountZero();
	/**
	 * 库存预警
	 * @param c (预警的数量)
	 * @return
	 */
	List<Store> StoreYJ(int c);
	/**
	 * 使用时这个方法时注意,把原批号pihao就赋值给Store.guige,
	 * 然后把要改的批号pihao赋值给Store.pihao
	 */
	void UpdateStoreSomeInfo(Store store);
}
