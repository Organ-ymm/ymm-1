package com.ymm.dao;

import com.ymm.pojo.po.Users;
import com.ymm.pojo.vo.UsersQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UsersMapper {

    List<Users> listUsersByPage(Map<String, Object> map);

    Integer countUsers(@Param("usersQuery") UsersQuery usersQuery);

    Integer batchUpdateDel(Users user);
}
