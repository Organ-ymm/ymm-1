package com.ymm.web;

import com.ymm.pojo.dto.MessageResult;
import com.ymm.pojo.dto.Page;

import com.ymm.pojo.po.Orders;
import com.ymm.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
@RequestMapping("/order")
public class OrdersAction {
@Autowired
    OrdersService ordersService;
    @ResponseBody
    @RequestMapping(value="/list")
    public MessageResult<Orders> ordersListToJson(Page page){

       // System.out.println("*****************************你去那里了**********************");
        MessageResult<Orders> messageResult =new MessageResult<>();
        try {
            int count = ordersService.countOrders();
            List<Orders> ordersList = ordersService.selectAllOrders(page);
            messageResult.setCode(0);
            messageResult.setCount(count);
            messageResult.setMsg("success");
            messageResult.setData(ordersList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return messageResult;
    }

}

