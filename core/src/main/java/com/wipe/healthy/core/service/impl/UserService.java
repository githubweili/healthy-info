package com.wipe.healthy.core.service.impl;

import com.wipe.healthy.core.dao.write.UserWriteDao;
import com.wipe.healthy.core.model.User;
import com.wipe.healthy.core.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 用户信息服务实现
 * User:Created by wei.li
 * Date: on 2015/12/9.
 * Time:0:25
 */
@Service("userService")
public class UserService implements IUserService{

    @Resource
    UserWriteDao userWriteDao;


    @Override
    public Integer create(User user) {
        return this.userWriteDao.create(user);
    }
}
