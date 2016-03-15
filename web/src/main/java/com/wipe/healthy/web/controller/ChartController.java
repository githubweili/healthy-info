package com.wipe.healthy.web.controller;

import com.wipe.healthy.web.dto.AjaxResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 图表控制层
 * User:Created by wei.li
 * Date: on 2016/3/15.
 * Time:15:27
 */
@Controller
@RequestMapping(value = "/chart/")
public class ChartController {

    @ResponseBody
    @RequestMapping(value = "pulmonaryVCalorie")
    public AjaxResult pulmonaryVCalorie(){
        return new AjaxResult();
    }
}
