/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.week7i.share.modules.dimension.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.week7i.share.common.utils.DateUtils;
import com.week7i.share.common.utils.excel.ExportExcel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.week7i.share.common.config.Global;
import com.week7i.share.common.persistence.Page;
import com.week7i.share.common.web.BaseController;
import com.week7i.share.common.utils.StringUtils;
import com.week7i.share.modules.dimension.entity.News;
import com.week7i.share.modules.dimension.service.NewsService;

import java.util.List;

/**
 * 新闻参数维度Controller
 * @author xingqijiang
 * @version 2018-12-07
 */
@Controller
@RequestMapping(value = "${adminPath}/dimension/news")
public class NewsController extends BaseController {

	@Autowired
	private NewsService newsService;
	
	@ModelAttribute
	public News get(@RequestParam(required=false) String id) {
		News entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = newsService.get(id);
		}
		if (entity == null){
			entity = new News();
		}
		return entity;
	}
	
	@RequiresPermissions("dimension:news:view")
	@RequestMapping(value = {"list", ""})
	public String list(News news, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<News> page = newsService.findPage(new Page<News>(request, response), news);
		model.addAttribute("page", page);
		return "modules/dimension/newsList";
	}

	@RequiresPermissions("dimension:news:view")
	@RequestMapping(value = "form")
	public String form(News news, Model model) {
		model.addAttribute("news", news);
		return "modules/dimension/newsForm";
	}

	@RequiresPermissions("dimension:news:edit")
	@RequestMapping(value = "save")
	public String save(News news, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, news)){
			return form(news, model);
		}
		newsService.save(news);
		addMessage(redirectAttributes, "保存新闻维度成功");
		return "redirect:"+Global.getAdminPath()+"/dimension/news/?repage";
	}
	
	@RequiresPermissions("dimension:news:edit")
	@RequestMapping(value = "delete")
	public String delete(News news, RedirectAttributes redirectAttributes) {
		newsService.delete(news);
		addMessage(redirectAttributes, "删除新闻维度成功");
		return "redirect:"+Global.getAdminPath()+"/dimension/news/?repage";
	}

	/**
	 * 导出用户数据
	 * @param news
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("dimension:news:view")
	@RequestMapping(value = "export", method= RequestMethod.POST)
	public String exportFile(News news, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			String fileName = "新闻维度数据"+ DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
			List<News> list=newsService.findList(news);
			ExportExcel exportExcel=new ExportExcel("新闻维度数据", News.class);
			exportExcel.setDataList(list);
			exportExcel.write(response, fileName);
			exportExcel.dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出新闻维度数据失败！失败信息："+e.getMessage());
		}
		return "redirect:" +Global.getAdminPath()+ "/dimension/news/?repage";
	}

}