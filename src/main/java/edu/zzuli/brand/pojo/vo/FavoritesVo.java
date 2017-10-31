package edu.zzuli.brand.pojo.vo;


import edu.zzuli.brand.pojo.po.Category;
import edu.zzuli.brand.pojo.po.Favorites;
import edu.zzuli.brand.pojo.po.User;

public class FavoritesVo extends Favorites {
   
	    private Category category;
	   
		private PageBean<Favorites> pageBean;
		private String user;
		
		
		

		public String getUser() {
			return user;
		}

		public void setUser(String user) {
			this.user = user;
		}

		public Category getCategory() {
			return category;
		}

		public void setCategory(Category category) {
			this.category = category;
		}

		public PageBean<Favorites> getPageBean() {
			return pageBean;
		}

		public void setPageBean(PageBean<Favorites> pageBean) {
			this.pageBean = pageBean;
		}
}
