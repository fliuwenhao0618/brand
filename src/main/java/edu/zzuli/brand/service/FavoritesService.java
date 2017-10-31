package edu.zzuli.brand.service;

import java.util.List;


import edu.zzuli.brand.pojo.po.Favorites;
import edu.zzuli.brand.pojo.vo.FavoritesVo;

public interface FavoritesService {

	int insert(Favorites favorite) throws Exception;

	List<Favorites> findByUid(String uid) throws Exception;

	int removeByFid(String fid) throws Exception;

	int findFavoritesCount(FavoritesVo favoritesVo);

	//List<Favorites> findByPage(FavoritesVo favoritesVo);

	List<Favorites> findByPage(FavoritesVo favoritesVo );

}
