package com.wipe.healthy.service.biz;

import com.google.common.base.Predicate;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Lists;
import com.wipe.healthy.constant.Constant;
import com.wipe.healthy.core.model.FitnessAction;
import com.wipe.healthy.core.model.User;
import com.wipe.healthy.core.service.IFitnessActionService;
import com.wipe.healthy.core.service.IUserService;
import com.wipe.healty.common.utils.AlgorithmUtils;
import com.wipe.healty.common.utils.LangUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

/**
 * 图表服务层
 * User:Created by wei.li
 * Date: on 2016/3/14.
 * Time:13:50
 */

@Service
public class ChartBiz {

    @Resource
    IFitnessActionService fitnessActionService;

    @Resource
    IUserService userService;

    /**
     * 拼接 肺活量V图表数据
     * @return 肺活量V图表数据
     */
    public ArrayListMultimap pulmonaryVCalorie(){
        ArrayListMultimap multimap = ArrayListMultimap.create();
        List<Float> calorieFilterList = this.evaluationCalorie();
        multimap.putAll("calorieList",calorieFilterList);
        return multimap;
    }


    /**
     * 拼接 体重-肺活量/心率图表数据
     * @return 体重-肺活量/心率图表数据
     */
    public ArrayListMultimap weightVPulmonary(){
        ArrayListMultimap multimap = ArrayListMultimap.create();
        List<Float> weightList = this.evaluationWeight();
        List<Float> pulmonaryList = this.evaluationPulmonary();
        List<Float> heartRateList = this.evaluationHeartRate();
        multimap.putAll("weightList",weightList);
        multimap.putAll("pulmonaryList",pulmonaryList);
        multimap.putAll("heartRateList",heartRateList);
        return multimap;
    }

    /**
     * 卡路里过滤取值
     * @return list
     */
    public List<Float> evaluationCalorie(){
        List<FitnessAction> fitnessActionList = fitnessActionService.list(new HashMap<String, Object>());
        final List<Float> calorieList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(fitnessActionList)){
            for (FitnessAction fitnessAction : fitnessActionList){
                calorieList.add(fitnessAction.getCalorie());
            }
        }
        //过滤取值
        List<Float> calorieFilterList = LangUtils.filter(calorieList, new Predicate<Float>() {
            @Override
            public boolean apply(Float input) {
                Float max = Collections.max(calorieList);
                Float min = Collections.min(calorieList);
                for (int i = 0; i < Constant.CHART_Y_NUM; i++) {
                    float targetNum = (max - min) / Constant.CHART_Y_NUM * (i + 1);
                    float result = AlgorithmUtils.approach(calorieList, targetNum);
                    if (input.equals(result)) {
                        return true;
                    }
                }
                return false;
            }
        });
        return calorieFilterList;
    }


    /**
     * 体重过滤
     * @return list
     */
    public List<Float> evaluationWeight(){
        List<User> userList = userService.list(new HashMap<String, Object>());
        final List<Float> weightList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(userList)){
            for (User user : userList){
                weightList.add(user.getWeight());
            }
        }

        List<Float> weightFilterList = Lists.newArrayList();
        Float max = Collections.max(weightList);
        Float min = Collections.min(weightList);
        for (int i = 0; i<Constant.CHART_Y_NUM;i++){
            float targetNum = (max - min) / Constant.CHART_Y_NUM * (i + 1);
            float result = AlgorithmUtils.approach(weightList, targetNum);
            weightFilterList.add(result);
        }


        return weightFilterList;
    }


    /**
     * 肺活量过滤
     * @return list
     */
    public List<Float> evaluationPulmonary(){
        List<User> userList = userService.list(new HashMap<String, Object>());
        final List<Float> pulmonaryList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(userList)){
            for (User user : userList){
                pulmonaryList.add(user.getPulmonary());
            }
        }

        List<Float> heightFilterList = Lists.newArrayList();
        Float max = Collections.max(pulmonaryList);
        Float min = Collections.min(pulmonaryList);
        for (int i = 0; i<Constant.CHART_X_NUM;i++){
            float targetNum = (max - min) / Constant.CHART_X_NUM * (i + 1);
            float result = AlgorithmUtils.approach(pulmonaryList, targetNum);
            heightFilterList.add(result);
        }

        return heightFilterList;
    }

    /**
     * 心率过滤
     * @return list
     */
    public List<Float> evaluationHeartRate(){
        List<User> userList = userService.list(new HashMap<String, Object>());
        final List<Float> heartRateList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(userList)){
            for (User user : userList){
                heartRateList.add(user.getHeartRate());
            }
        }

        List<Float> heightFilterList = Lists.newArrayList();
        Float max = Collections.max(heartRateList);
        Float min = Collections.min(heartRateList);
        for (int i = 0; i<Constant.CHART_X_NUM;i++){
            float targetNum = (max - min) / Constant.CHART_X_NUM * (i + 1);
            float result = AlgorithmUtils.approach(heartRateList, targetNum);
            heightFilterList.add(result);
        }

        return heightFilterList;
    }


}
