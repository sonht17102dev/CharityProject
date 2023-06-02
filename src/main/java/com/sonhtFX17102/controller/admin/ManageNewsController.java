package com.sonhtFX17102.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.News;
import com.sonhtFX17102.entities.Partner;
import com.sonhtFX17102.service.impl.NewsImpl;

@Controller
@RequestMapping(value= "admin")
public class ManageNewsController extends BaseController{
	private NewsImpl newsService;
	
	@Autowired
	public ManageNewsController(NewsImpl newsService) {
		this.newsService = newsService;
	}

	@RequestMapping(value= "quan-ly-tin-tuc", method = RequestMethod.GET)
	public ModelAndView manageNews(HttpServletRequest request) {
		
		_mvShareAdmin.setViewName("admin/news/manageNews");
		String indexPage = request.getParameter("trang");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		int countPage = newsService.getCountAllNews();
		int endPage = countPage / 6;
		if (countPage % 6 != 0) {
			endPage++;
		}
		String action = request.getParameter("action");
		String idS = request.getParameter("id");
		int id;
		if(action != null  && idS != null && action.equals("deleteNews")) {
			id = Integer.parseInt(idS);
			newsService.deleteNewsById(id);
		}
		_mvShareAdmin.addObject("listTop6News", newsService.getPagingPage(index));
		_mvShareAdmin.addObject("endPage", endPage);
		_mvShareAdmin.addObject("tag", index);
		return _mvShareAdmin;
	}
	
	@RequestMapping(value= "them-tin-tuc", method = RequestMethod.GET)
	public String addNews(Model model) {
//		_mvShareAdmin.setViewName("admin/news/addNews");
		model.addAttribute("news", new News());
		return "admin/news/addNews";
	}
	@RequestMapping(value= "them-tin-tuc", method = RequestMethod.POST)
	public String doAddNews(HttpServletRequest request,@ModelAttribute("news") News news, Model model) {
		News existingNews = newsService.checkNewsByTitleExisted(news.getNews_description());
		if (existingNews == null) {
			newsService.insertNews(news.getNews_description(), news.getNews_img_banner(),
					news.getNews_post_date(), news.getNews_content());
			model.addAttribute("messageNews", "Thêm mới thành công !!!");
			return "admin/news/manageNews";

		} else {
			model.addAttribute("messageNews", "Thêm mới thất bại - Tin tức này đã tồn tại vui lòng thử lại !!!");
			return "admin/news/addNews";
			
		}
	}
	@RequestMapping(value= "cap-nhat-tin-tuc", method = RequestMethod.GET)
	public ModelAndView editNews(@RequestParam("id") int id) {
		News news = newsService.getNewsById(id);
		_mvShareAdmin.addObject("news", news);
		_mvShareAdmin.setViewName("admin/news/editNews");
		return _mvShareAdmin;
	}
	@RequestMapping(value= "cap-nhat-tin-tuc", method = RequestMethod.POST)
	public String doEditNews(HttpServletRequest request) {
		
		String status = request.getParameter("news_status");
		String des = request.getParameter("news_description");
		String banner = request.getParameter("news_img_banner");
		String date = request.getParameter("news_post_date");
		String content = request.getParameter("news_content");
		String idS = request.getParameter("news_id");
		int id = Integer.parseInt(idS);
		
		newsService.updateNewsById(id, des, banner, date, content, status);
		request.setAttribute("messageNews", "Cập nhật thành công !!!");
		return "admin/news/manageNews";
	}
}
