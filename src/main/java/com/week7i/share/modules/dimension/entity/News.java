/**
 * Copyright &copy; 2018-2028 <a href="https://github.com/jxq0816/share_frame_mini">share</a> All rights reserved.
 */
package com.week7i.share.modules.dimension.entity;

import org.hibernate.validator.constraints.Length;

import com.week7i.share.common.persistence.DataEntity;

/**
 * 新闻参数维度Entity
 * @author xingqijiang
 * @version 2018-12-07
 */
public class News extends DataEntity<News> {
	
	private static final long serialVersionUID = 1L;
	private String campaignId;		// 名称
	private String title;		// 标题
	private String url;		// 连接
	
	public News() {
		super();
	}

	public News(String id){
		super(id);
	}

	@Length(min=0, max=20, message="名称长度必须介于 0 和 20 之间")
	public String getCampaignId() {
		return campaignId;
	}

	public void setCampaignId(String campaignId) {
		this.campaignId = campaignId;
	}
	
	@Length(min=0, max=20, message="标题长度必须介于 0 和 20 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=200, message="连接长度必须介于 0 和 200 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}