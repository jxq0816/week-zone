/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.week7i.share.modules.dimension.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.week7i.share.common.persistence.Page;
import com.week7i.share.common.service.CrudService;
import com.week7i.share.modules.dimension.entity.News;
import com.week7i.share.modules.dimension.dao.NewsDao;

/**
 * 新闻参数维度Service
 * @author xingqijiang
 * @version 2018-12-07
 */
@Service
@Transactional(readOnly = true)
public class NewsService extends CrudService<NewsDao, News> {

	public News get(String id) {
		return super.get(id);
	}
	
	public List<News> findList(News news) {
		return super.findList(news);
	}
	
	public Page<News> findPage(Page<News> page, News news) {
		return super.findPage(page, news);
	}
	
	@Transactional(readOnly = false)
	public void save(News news) {
		super.save(news);
	}
	
	@Transactional(readOnly = false)
	public void delete(News news) {
		super.delete(news);
	}
	
}