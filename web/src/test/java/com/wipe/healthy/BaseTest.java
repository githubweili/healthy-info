package com.wipe.healthy;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



/**
 * Created by IntelliJ IDEA.
 * User:Created by wei.li
 * Date: on 2015/12/9.
 * Time:8:50
 * To change this template use File | Settings | File and Code Templates.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-dao.xml","classpath:spring-mvc.xml"})
public abstract class BaseTest {
    protected final Logger logger = LoggerFactory.getLogger(getClass());
}
