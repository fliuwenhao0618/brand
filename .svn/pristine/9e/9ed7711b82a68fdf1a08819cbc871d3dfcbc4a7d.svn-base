package edu.zzuli.brand.service.impl;

import java.util.List;
import javax.annotation.Resource;
import edu.zzuli.brand.exception.CustomException;
import edu.zzuli.brand.mapper.BrandMapper;
import edu.zzuli.brand.mapper.BrandMapperCustom;
import edu.zzuli.brand.pojo.po.Brand;
import edu.zzuli.brand.pojo.po.BrandExample;
import edu.zzuli.brand.pojo.vo.BrandVo;



import edu.zzuli.brand.service.BrandService;

public class BrandServiceImpl implements BrandService{

    
	@Resource
	private BrandMapper brandMapper;
	@Resource
	private BrandMapperCustom brandMapperCustom ;
	@Override
	public List<Brand> selectByExample(BrandExample example) {
		
		return brandMapper.selectByExample(example);
	}
	@Override
	public List<Brand> findByPage(BrandVo brandVo) throws Exception {
		return brandMapperCustom.findByPage(brandVo);
	}
	@Override
	public int findBrandCount(BrandVo brandVo) throws Exception {
		return brandMapperCustom.findBrandCount(brandVo);
	}
	@Override
	public List<Brand> query(String bname) throws Exception {
		List<Brand> list =  brandMapperCustom.query(bname);
		if(null == list || list.size() ==0 ){
			throw new CustomException("没有此商标，看看其他的？");
		}
		return list;
	}
	@Override
	public List<Brand> queryByremen(String example) throws Exception {
		List<Brand> list =  brandMapperCustom.queryByremen(example);
		if(null == list || list.size() ==0 ){
			throw new CustomException("没有此商标，看看其他的？");
		}
		return list;
	}
	
	///////////////////////////////////////////////////后台方法
	@Override
	public int insert(Brand brand) {
		
		return brandMapper.insert(brand);
	}
	@Override
	public int deleteByPrimaryKey(String bid) {
		//不查了。直接删，这东西真不想写了
		return brandMapper.deleteByPrimaryKey(bid);
	}
	@Override
	public int updateByPrimaryKey(Brand record) {
		
		return brandMapper.updateByPrimaryKey(record);
	}
	@Override
	public Brand selectByPrimaryKey(String bid) {
		
		return brandMapper.selectByPrimaryKey(bid);
	}
	

	/**
	 * 查询所有brand
	 */
	@Override
	public List<Brand> selectBrands() {
		
		return brandMapper.selectByExample(null);
	}
	/**
	 * 按bid查询brand
	 */
	@Override
	public Brand selectBrandByBid(String bid) {
	
		return brandMapper.selectByPrimaryKey(bid);
	}


	@Override
	public List<Brand> selectBrandsByCid(String cid) {
		
		return brandMapperCustom.selectByCid(cid);
	}

	@Override
	public List<Brand> findByApplication(String application) {
	
		
		return brandMapperCustom.selectByApplication(application);
	}

}
