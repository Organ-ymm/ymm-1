package com.ymm.service.impl;

import com.ymm.dao.GoodsMapper;
import com.ymm.pojo.dto.Page;
import com.ymm.pojo.dto.SwitchCheck;
import com.ymm.commons.pojo.po.Goods;
import com.ymm.pojo.vo.GoodsCustom;
import com.ymm.pojo.vo.GoodsQuery;
import com.ymm.service.GoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private GoodsMapper goodsdao;

    @Override
    public List<GoodsCustom> listGoods(Page page, GoodsQuery query) {
        List<GoodsCustom> goodsCustomList = null;
        try {
            goodsCustomList = goodsdao.selectGoodsByPage(page,query);
        } catch (Exception e) {
            logger.debug(e.getMessage(), e);
        }
        return goodsCustomList;
    }

    @Override
    public Long countItems() {
        return goodsdao.countItems();
    }

    @Override
    public int goodsDelById(Integer id) {
        return goodsdao.updateGoodsById(id);
    }

    @Override
    public int batchUpdate(List<Integer> ids) {
        int i = 0;
        for (Integer id :
                ids) {
           i += goodsdao.updateGoodsById(id);
        }
        return i;
    }

    @Override
    public int addGoods(Goods goods) {
        //添加时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        final String time = sdf.format(System.currentTimeMillis());
        goods.setAdd_time(time);
        //判断开关状态(由于layui中switch关闭状态不传值,所以只能重新判断手动传值)
        if (goods.getIs_hot()==0){
            goods.setIs_hot(2);
        }
        if (goods.getIs_new()==0){
            goods.setIs_new(2);
        }
        if (goods.getStatus()==0){
            goods.setStatus(2);
        }
        return goodsdao.insertGoods(goods);
    }
    @Override
    public int editGoods(Goods goods) {
        return goodsdao.updateGoods(goods);
    }

	@Override
    public int goodsIsNew(SwitchCheck switchCheck) {
        return goodsdao.updateGoodsNew(switchCheck);
    }

    @Override
    public int goodsIsHot(SwitchCheck switchCheck) {
        return goodsdao.updateGoodsHot(switchCheck);
    }

    @Override
    public int goodsStatus(SwitchCheck switchCheck) {
        return goodsdao.updateGoodsStatus(switchCheck);
    }



}
