package com.ymm.service;

import com.ymm.pojo.po.Rank;
import com.ymm.pojo.vo.UserCustom;

import java.util.List;

public interface RankService {

    List<Rank> listRank();

    Integer countRank();

    Integer addRank(Rank rank);

    Integer editRank(Rank rank);

    Integer findMaxRankId();

    Integer delRank(Integer rank_id);

    List<UserCustom> ListRankSum();
}
