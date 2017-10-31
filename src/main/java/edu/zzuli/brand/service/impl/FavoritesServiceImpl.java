package edu.zzuli.brand.service.impl;

import java.util.List;

import javax.annotation.Resource;

import edu.zzuli.brand.mapper.FavoritesMapper;
import edu.zzuli.brand.pojo.po.Favorites;
import edu.zzuli.brand.pojo.vo.FavoritesVo;
import edu.zzuli.brand.service.FavoritesService;

public class FavoritesServiceImpl implements FavoritesService {
	
	@Resource
	private FavoritesMapper favoritesMapper;
	
	@Override
	public int insert(Favorites favorite) throws Exception {
		// TODO Auto-generated method stub
		return favoritesMapper.insert(favorite);
	}

	@Override
	public List<Favorites> findByUid(String uid) throws Exception {
		
		return favoritesMapper.findByUid(uid);
	}

	@Override
	public int removeByFid(String fid) throws Exception{
		// TODO Auto-generated method stub
		return favoritesMapper.deleteByPrimaryKey(fid);
	}

	@Override
	public int findFavoritesCount(FavoritesVo favoritesVo) {
		
		return favoritesMapper.findFavoritesCount(favoritesVo);
	}

	@Override
	public List<Favorites> findByPage(FavoritesVo favoritesVo) {
		
		return favoritesMapper.findByPage(favoritesVo);
	}

}
