package com.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.Gonghuoshang;


@Repository
public interface GonghuoshangMapper {
		void AddGHS(String gonghuoshang);
		void DelGHS(String gonghuoshang);
		List<Gonghuoshang> QueryGHS(String gonghuoshang);
		List<Gonghuoshang> GeyAllGHS();
}
