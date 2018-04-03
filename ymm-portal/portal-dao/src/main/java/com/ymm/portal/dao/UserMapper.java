package com.ymm.portal.dao;

import com.ymm.commons.dto.Page;
import com.ymm.commons.pojo.po.Orders;
import com.ymm.commons.pojo.po.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface UserMapper {
    Users queryByUsernameOrPhone(Users user);
    Users checkLogin(Users user);

    void register(Users user);

    Users checkOldPass(Users user);
    Users selectUserAddressCartOrders(Users user);

    List<Order> getPayOrder(Users user);

    List<Order> getDeliverOrder(Users user);

    List<Orders> selectOrdersAndGoods(@Param("user") Users user,@Param("page") Page page);

    int countOrder(Users user);
}
