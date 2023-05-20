package com.sonhtFX17102.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.News;
import com.sonhtFX17102.service.impl.CircumImpl;
import com.sonhtFX17102.service.impl.NewsImpl;

@Controller
public class NewsController extends BaseController{
	@Autowired
	private CircumImpl circumService;
	@Autowired
	private NewsImpl newsService;
	
	@RequestMapping(value = "/tin-tuc", method = RequestMethod.GET )
	public ModelAndView news() {
		List<News> listNews = newsService.getTop6List();
		List<News> latest_news = new ArrayList<>();
		latest_news.add(listNews.get(0));
		
		_mvShare.addObject("latest_news", latest_news);
		//listNews.remove(0);
		_mvShare.addObject("listAllNews", listNews);
		List<Circum> list = circumService.getTop3Circums();
		for (Circum circum : list) {
			String[] imgs = {splitImage(circum.getCircum_image()) };
			String imgNotStyle = removeStyle(imgs[0]);
			circum.setCircum_image(imgNotStyle);
		}
		int size = newsService.getAllNews().size();
		_mvShare.addObject("listTop3Circum", list);
		_mvShare.addObject("category", category);
		_mvShare.addObject("size", size);
		_mvShare.setViewName("user/news/news");
		return _mvShare;
	}
	@RequestMapping(value = "/tin-tuc-chi-tiet", method = RequestMethod.GET)
	public ModelAndView newsDetails (@RequestParam("id") int id) {
		List<Circum> listC = circumService.getTop3Circums();
		for (Circum circum : listC) {
			String[] imgs = {splitImage(circum.getCircum_image()) };
			String imgNotStyle = removeStyle(imgs[0]);
			circum.setCircum_image(imgNotStyle);
		}
		News news = newsService.getNewsById(id);
		_mvShare.addObject("news", news);
		_mvShare.addObject("category", category);
		_mvShare.addObject("listCircum", listC);
		_mvShare.setViewName("user/news/news_detail");
		return _mvShare; 
	}
	@RequestMapping(value = "/loadmore", method = RequestMethod.GET)
	@ResponseBody
	public String loadMore(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String amount = request.getParameter("existItems");
		int iamount = Integer.parseInt(amount);
		List<News> list = newsService.getNext6News(iamount);
		String content = "";
		for (News news : list) {
			content += "<div class=\"news_st news_wrapper\">\r\n"
					+ "	<div class=\"news_items_banner\">\r\n"
					+ "		<a href=\"tin-tuc-chi-tiet?id="+news.getNews_id()+"\"\r\n"
					+ "							style=\"width: 100%;\"><img src=\""+news.getNews_img_banner()+"\"></a>"
					+ "	</div>\r\n"
					+ "	<div class=\"news_items_date\">\r\n"
					+ "		<span>"+news.getNews_post_date()+"</span>\r\n"
					+ "	</div>\r\n"
					+ "	<div class=\"news_items_des\">\r\n"
					+ "		<h4>\r\n"
					+ "			<a href=\"tin-tuc-chi-tiet?id="+news.getNews_id()+"\"\r\n"
					+ "								style=\"width: 100%;\">"+news.getNews_description()+"</a>	"
					+ "		</h4>\r\n"
					+ "	</div>\r\n"
					+ "</div>";
		}
		return content;
	}
}
