package edu.zzuli.brand.service;


import java.util.List;

import edu.zzuli.brand.pojo.po.Brand;
import edu.zzuli.brand.pojo.po.BrandExample;
import edu.zzuli.brand.pojo.vo.BrandVo;




public interface BrandService {
   
	 List<Brand> selectByExample(BrandExample example);
	 public List<Brand> findByPage(BrandVo brandVo)throws Exception;
		//查询总记录数
	 public int findBrandCount(BrandVo brandVo) throws Exception;
	 public List<Brand> query(String bname) throws Exception;
	 public List<Brand> queryByremen(String example) throws Exception;
	 int insert(Brand record);
	 int deleteByPrimaryKey(String bid);
	 int updateByPrimaryKey(Brand record);
	 Brand selectByPrimaryKey(String bid);
	List<Brand> selectBrands();

	Brand selectBrandByBid(String bid);

	List<Brand> selectBrandsByCid(String string);

	List<Brand> findByApplication(String application);

}
