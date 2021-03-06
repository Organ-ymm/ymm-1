package com.ymm.web;

import com.ymm.commons.pojo.dto.ResultObject;
import com.ymm.pojo.dto.MessageResult;
import com.ymm.pojo.dto.Page;
import com.ymm.pojo.dto.SwitchCheck;
import com.ymm.commons.pojo.po.Goods;
import com.ymm.pojo.vo.GoodsCustom;
import com.ymm.pojo.vo.GoodsQuery;
import com.ymm.service.GoodsService;
import com.ymm.service.SearchGoodCustomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/goods")
public class ManagerGoodsAction {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private SearchGoodCustomService searchGoodCustomService;

    @RequestMapping("/goodslist")
    @ResponseBody
    public MessageResult<GoodsCustom> listGoodsToJson(Page page, GoodsQuery query) {
        //System.out.println(query);
        //从后台把所有商品的数据查询到List，把List封装MessageResult
        MessageResult<GoodsCustom> messageResult = new MessageResult<>();
        try {
            Long count = goodsService.countItems();
            List<GoodsCustom> goodsCustomList = goodsService.listGoods(page, query);
            messageResult.setCode(0);
            messageResult.setCount(count);
            messageResult.setData(goodsCustomList);
            messageResult.setMsg("success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return messageResult;
    }

    /**
     * 根据id删除商品
     *
     * @param id
     * @return
     */
    @RequestMapping("/goods_del")
    @ResponseBody
    public int goodsDelById(@RequestParam(value = "id") Integer id) {
        int i = 0;
        try {
            i = goodsService.goodsDelById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/batch", method = RequestMethod.POST)
    public int batchUpdate(@RequestParam("ids[]") List<Integer> ids) {
        int i = 0;
        try {
            //调用业务逻辑层方法
            i = goodsService.batchUpdate(ids);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    /**
     * 新增商品
     *
     * @param goods
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/goods_add", method = RequestMethod.POST)
    public int goods_add(Goods goods) {
        int i = 0;
        try {
            i = goodsService.addGoods(goods);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
    @ResponseBody
    @RequestMapping(value = "/goods_edit",method = RequestMethod.POST)
    public int goods_edit(Goods goods){
        int i = 0;
        try {
            i = goodsService.editGoods(goods);
        }catch (Exception e){
            e.printStackTrace();
        }
        return i;
    }
    /**
     * 根据前端switch状态来改变goods_is_new
     *
     * @param switchCheck
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/goods_is_new", method = RequestMethod.GET)
    public int goods_is_new(SwitchCheck switchCheck) {

        int i = 0;
        try {
            i = goodsService.goodsIsNew(switchCheck);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    /**
     * 根据前端switch状态来改变goods_is_hot
     *
     * @param switchCheck
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/goods_is_hot", method = RequestMethod.GET)
    public int goods_is_hot(SwitchCheck switchCheck) {
        int i = 0;
        try {
            i = goodsService.goodsIsHot(switchCheck);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    /**
     * 根据前端switch状态来改变goods_status
     *
     * @param switchCheck
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/goods_status", method = RequestMethod.GET)
    public int goods_status(SwitchCheck switchCheck) {
        int i = 0;
        try {
            i = goodsService.goodsStatus(switchCheck);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    /**
     * 一键导入solr索引
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/import",method = RequestMethod.POST)
    public ResultObject importIndex(){
        return searchGoodCustomService.importIndex();
    }
}
