/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.week7i.share.modules.dimension.dao;

import com.week7i.share.common.persistence.CrudDao;
import com.week7i.share.common.persistence.annotation.MyBatisDao;
import com.week7i.share.modules.dimension.entity.News;

/**
 * 新闻参数维度DAO接口
 * @author xingqijiang
 * @version 2018-12-07
 */
@MyBatisDao
public interface NewsDao extends CrudDao<News> {
	
}