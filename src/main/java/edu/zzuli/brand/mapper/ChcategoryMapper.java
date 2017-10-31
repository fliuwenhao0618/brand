package edu.zzuli.brand.mapper;

import edu.zzuli.brand.pojo.po.Chcategory;
import edu.zzuli.brand.pojo.po.ChcategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ChcategoryMapper {
    int countByExample(ChcategoryExample example);

    int deleteByExample(ChcategoryExample example);

    int deleteByPrimaryKey(String chid);

    int insert(Chcategory record);

    int insertSelective(Chcategory record);

    List<Chcategory> selectByExample(ChcategoryExample example);

    Chcategory selectByPrimaryKey(String chid);

    int updateByExampleSelective(@Param("record") Chcategory record, @Param("example") ChcategoryExample example);

    int updateByExample(@Param("record") Chcategory record, @Param("example") ChcategoryExample example);

    int updateByPrimaryKeySelective(Chcategory record);

    int updateByPrimaryKey(Chcategory record);
}