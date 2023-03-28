package com.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.Rxdrug;

@Repository
public interface RxdrugMapper {
		void AddRxdrug(Rxdrug rxd);
		void DelRxdrug(String time);
		List<Rxdrug> GetIt(String time);
		Integer CountNullRx();
		/**
		 * @return 获取未记录的处方药购药时间(time主键)
		 */
		List<String> GetAllOverTime();
		/**
		 * 查询登记的处方药购药记录
		 * @param drug
		 * @return
		 */
		List<String> GetSomeDrugTime(String drug);
}
