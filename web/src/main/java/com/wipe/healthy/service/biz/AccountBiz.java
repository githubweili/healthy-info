package com.wipe.healthy.service.biz;

import com.wipe.healthy.core.model.Account;
import com.wipe.healthy.core.service.IAccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 账户业务服务层
 * User:Created by wei.li
 * Date: on 2016/3/2.
 * Time:11:32
 */

@Service
public class AccountBiz {
    @Resource
    IAccountService accountService;

    /**
     * 账户信息新增
     * @param account 账户信息
     * @return 新增账户主键
     */
    public Integer create(Account account){
        return  accountService.create(account);
    }

    /**
     * 账户信息修改
     * @param account 账户信息
     * @return 修改结果（true/false）
     */
    public Boolean update(Account account){
        return accountService.update(account);
    }

    /**
     * 账户信息删除
     * @param id 账户信息主键
     * @return 删除结果（true/false）
     */
    public Boolean delete(Integer id){
        return accountService.delete(id);
    }

    /**
     * 根据主键查找账户信息
     * @param id 账户主键
     * @return 账户信息
     */
    public Account findById(Integer id){
        return accountService.findById(id);
    }


    /**
     * 根据条件查询账户信息
     * @param query 查询条件
     * @return 账户信息列表
     */
    public List<Account> list(Map<String,Object> query){
        return accountService.list(query);
    }

    /**
     * 根据id集合查找账户信息
     * @param ids 主键集合
     * @return 账户信息列表
     */
    public List<Account> batchQuery(Set<Integer> ids){
        return accountService.batchQuery(ids);
    }
}
