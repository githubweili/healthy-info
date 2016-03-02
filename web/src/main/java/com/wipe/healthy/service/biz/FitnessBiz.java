package com.wipe.healthy.service.biz;

import com.wipe.healthy.core.model.FitnessAction;
import com.wipe.healthy.core.service.IActionInfoService;
import com.wipe.healthy.core.service.IFitnessActionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 健身行为服务层
 * User:Created by wei.li
 * Date: on 2016/3/2.
 * Time:12:00
 */
@Service
public class FitnessBiz {
    @Resource
    IFitnessActionService fitnessActionService;

    @Resource
    IActionInfoService actionInfoService;
    /**
     * 健身行为信息新增
     * @param fitnessAction 健身行为
     * @return 新增健身信息主键
     */
    public boolean create(FitnessAction fitnessAction){
        return false;
    }

    /**
     * 修改健身行为信息
     * @param fitnessAction 健身行为信息
     * @return 修改结果（true/false）
     */
    public Boolean update(FitnessAction fitnessAction){
        return false;
    }

    /**
     * 删除健身信息行为
     * @param id 健身行为信息主键
     * @return 删除结果（true/false）
     */
    public Boolean delete(Integer id){
        return false;
    }

}
