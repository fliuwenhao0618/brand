package edu.zzuli.brand.mapper;

import edu.zzuli.brand.pojo.po.Demand;
import edu.zzuli.brand.pojo.po.DemandExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DemandMapper {
    int countByExample(DemandExample example);

    int deleteByExample(DemandExample example);

    int deleteByPrimaryKey(String did);

    int insert(Demand record);

    int insertSelective(Demand record);

    List<Demand> selectByExample(DemandExample example);

    Demand selectByPrimaryKey(String did);

    int updateByExampleSelective(@Param("record") Demand record, @Param("example") DemandExample example);

    int updateByExample(@Param("record") Demand record, @Param("example") DemandExample example);

    int updateByPrimaryKeySelective(Demand record);

    int updateByPrimaryKey(Demand record);
}