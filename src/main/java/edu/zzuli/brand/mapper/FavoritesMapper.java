package edu.zzuli.brand.mapper;

import edu.zzuli.brand.pojo.po.Favorites;
import edu.zzuli.brand.pojo.po.FavoritesExample;
import edu.zzuli.brand.pojo.vo.FavoritesVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FavoritesMapper {
    int countByExample(FavoritesExample example);

    int deleteByExample(FavoritesExample example);

    int deleteByPrimaryKey(String fid);

    int insert(Favorites record);

    int insertSelective(Favorites record);

    List<Favorites> selectByExample(FavoritesExample example);

    Favorites selectByPrimaryKey(String fid);

    int updateByExampleSelective(@Param("record") Favorites record, @Param("example") FavoritesExample example);

    int updateByExample(@Param("record") Favorites record, @Param("example") FavoritesExample example);

    int updateByPrimaryKeySelective(Favorites record);

    int updateByPrimaryKey(Favorites record);
    List<Favorites> findByUid(String uid);

	int findFavoritesCount(FavoritesVo favoritesVo);

	List<Favorites> findByPage(FavoritesVo favoritesVo);
}