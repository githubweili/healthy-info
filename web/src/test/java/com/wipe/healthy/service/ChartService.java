package com.wipe.healthy.service;

import com.wipe.healthy.BaseTest;
import com.wipe.healthy.service.biz.ChartBiz;

import org.junit.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * User:Created by wei.li
 * Date: on 2016/3/15.
 * Time:15:31
 */
public class ChartService extends BaseTest {

    @Autowired
    ChartBiz chartBiz;

   @org.junit.Test
    public void test(){
        chartBiz.pulmonaryVCalorie();
    }
}
