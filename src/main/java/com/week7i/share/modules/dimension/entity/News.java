/**
 * Copyright &copy; 2018-2028 <a href="https://github.com/jxq0816/share_frame_mini">share</a> All rights reserved.
 */
package com.week7i.share.modules.dimension.entity;

import com.week7i.share.common.utils.excel.annotation.ExcelField;
import org.hibernate.validator.constraints.Length;

import com.week7i.share.common.persistence.DataEntity;

import java.util.Date;

/**
 * 新闻参数维度Entity
 * @author xingqijiang
 * @version 2018-12-07
 */
public class News extends DataEntity<News> {
	
	private static final long serialVersionUID = 1L;
	private String campaignId;		// 编号
	private String title;		// 标题
	private String url;		// 连接
	
	public News() {
		super();
	}

	public News(String id){
		super(id);
	}

	@ExcelField(title="新闻编号", align=2, sort=1)
	@Length(min=0, max=20, message="编号长度必须介于 0 和 20 之间")
	public String getCampaignId() {
		return campaignId;
	}

	public void setCampaignId(String campaignId) {
		this.campaignId = campaignId;
	}

	@ExcelField(title="新闻标题", align=10, sort=2)
	@Length(min=0, max=20, message="标题长度必须介于 0 和 20 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@ExcelField(title="超链接", align=10, sort=3)
	@Length(min=0, max=200, message="连接长度必须介于 0 和 200 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@ExcelField(title="更新人", type=0, align=1, sort=4)
	public String getUpdateUser() {
		return updateBy.getName();
	}

	@ExcelField(title="更新时间", type=0, align=1, sort=5)
	public Date getUpdateDate2() {
		return updateDate;
	}

	@ExcelField(title="备注", type=0, align=1, sort=6)
	public String getRemark() {
		return remarks;
	}
}