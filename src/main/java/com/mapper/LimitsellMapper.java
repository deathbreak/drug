package com.mapper;

import com.bean.Gonghuoshang;
import com.bean.Limitsell;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface LimitsellMapper {
    void AddLimit(Limitsell limitsell);

    void DelLimit(@Param("drugname")String drugname, @Param("changshang")String changshang);

    Integer QueryLimit(@Param("drugname")String drugname, @Param("changshang")String changshang);

    List<Limitsell> GetAllLimit();

    int CountLimit(@Param("drugname")String drugname, @Param("changshang")String changshang);
}
