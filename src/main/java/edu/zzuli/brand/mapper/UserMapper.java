package edu.zzuli.brand.mapper;

import edu.zzuli.brand.pojo.po.User;
import edu.zzuli.brand.pojo.po.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(String uid);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(String uid);
    
    //新增按姓名查询
    User selectByUsername(String username);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    public void updateByName(User user);//更新信息
    
    public void ByNameUpdatePassword(User user);//修改密码
    
    
}