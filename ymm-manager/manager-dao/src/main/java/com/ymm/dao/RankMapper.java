package com.ymm.dao;

import com.ymm.pojo.po.Rank;
import com.ymm.pojo.vo.UserCustom;

import java.util.List;

public interface RankMapper {

    List<Rank> listRank();

    Integer countRank();

    Integer addRank(Rank rank);

    Integer editRank(Rank rank);

    Integer findMaxRankId();

    Integer delRank(Rank rank);

    List<UserCustom> ListRankSum();
}
