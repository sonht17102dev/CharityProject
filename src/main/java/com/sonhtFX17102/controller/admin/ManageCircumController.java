package com.sonhtFX17102.controller.admin;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.DTO.Category;
import com.sonhtFX17102.DTO.CircumDTO;
import com.sonhtFX17102.controller.BaseController;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.service.impl.CircumImpl;

@Controller
@RequestMapping(value = "admin")
public class ManageCircumController extends BaseController {
	@Autowired
	private CircumImpl circumService;
	

	@RequestMapping(value = "quan-ly-quyen-gop", method = RequestMethod.GET)
	public ModelAndView manageCircum(HttpServletRequest request) {
		_mvShareAdmin.setViewName("admin/circum/manageCircum");
		request.removeAttribute("message");

		String indexPage = request.getParameter("trang");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		int countPage = circumService.getCountAllCircums();
		int endPage = countPage / 10;
		if (countPage % 10 != 0) {
			endPage++;
		}
		String action = request.getParameter("action");
		String status = request.getParameter("status");
		String id = request.getParameter("id");
		int idd;
		List<Circum> list = circumService.getPagingPageAdmin(index);
//		List<Circum> list = circumService.getAllCircums();
		if (action != null && action.equals("deleteCircum") && status.equals("active")) {
			idd = Integer.parseInt(id);
			circumService.updateStatus(idd, "inactive");
		}
		if (action != null && action.equals("deleteCircum") && status.equals("inactive")) {
			//String id = request.getParameter("id");
			idd = Integer.parseInt(id);
			circumService.updateStatus(idd, "active");
		}
		
		List<Circum> listInactive = circumService.findCircumsInactive("inactive");
		_mvShareAdmin.addObject("listInactive", listInactive);
		_mvShareAdmin.addObject("listTop10Circum", list);
		_mvShareAdmin.addObject("endPage", endPage);
		_mvShareAdmin.addObject("tag", index);
		_mvShareAdmin.addObject("category", category);
		return _mvShareAdmin;
	}
	
	@RequestMapping(value = "cap-nhat-quyen-gop", method = RequestMethod.GET)
	public ModelAndView editCircum(HttpServletRequest request) {
		String idS = request.getParameter("id");
		int id = Integer.parseInt(idS);
		Circum circum = circumService.getCircumById(id);
		String[] images = circum.getCircum_image().split(",");
		List<String> listImages = Arrays.asList(images);

		// List<String> listCategories = Arrays.asList(category);
		_mvShareAdmin.addObject("category", category);
		_mvShareAdmin.addObject("images", listImages);
		_mvShareAdmin.addObject("circum", circum);
		_mvShareAdmin.setViewName("admin/circum/editCircum");
		return _mvShareAdmin;
	}

	@RequestMapping(value = "cap-nhat-quyen-gop", method = RequestMethod.POST)
	public String doEditCircum(HttpServletRequest request) {
		String id = request.getParameter("circum_id");
		String type = request.getParameter("circum_type");
		String pId = request.getParameter("partner_id");
		String name = request.getParameter("circum_name").trim();
		String des = request.getParameter("circum_des");
		String donation = request.getParameter("circum_donations");
		String target = request.getParameter("circum_target");
		String raise = request.getParameter("circum_raise");
		String end = request.getParameter("circum_time_end");
		String start = request.getParameter("circum_start_donate");
		String img = request.getParameter("circum_image");
		String splitString = img.substring(3, img.length() - 6);
		String content = request.getParameter("circum_content");
		String status = request.getParameter("circum_status");
		try {
			circumService.upDateCircum(Integer.parseInt(id), Integer.parseInt(pId), name, type, content, splitString, des, 
					Integer.parseInt(donation), Long.parseLong(target), Long.parseLong(raise), Integer.parseInt(end), start, status);
			return "redirect:quan-ly-quyen-gop";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Cập nhật thất bại - Tiêu đề đã tồn tại vui lòng thử lại !!!");
			
		}
		return "redirect:cap-nhat-quyen-gop";
	}

	@RequestMapping(value = "them-quyen-gop", method = RequestMethod.GET)
	public ModelAndView addCircum(HttpServletRequest request) {
		List<String> listCategories = Arrays.asList(category);
		_mvShareAdmin.addObject("category", listCategories);
		_mvShareAdmin.setViewName("admin/circum/addCircum");
		return _mvShareAdmin;
	}

	@RequestMapping(value = "them-quyen-gop", method = RequestMethod.POST)
	public ModelAndView doAddCircum(HttpServletRequest request) throws UnsupportedEncodingException {
		String idPartner = request.getParameter("partner_id");
		int idP = Integer.parseInt(idPartner);
		String type = request.getParameter("circum_type");
		String title = request.getParameter("circum_name").trim();
		String des = request.getParameter("circum_des");
		String donations = request.getParameter("circum_donations");
		int d = Integer.parseInt(donations);
		String raise = request.getParameter("circum_raise");
		long r = Long.parseLong(raise);
		String target = request.getParameter("circum_target");
		long t = Long.parseLong(target);
		String time_end = request.getParameter("circum_time_end");
		int te = Integer.parseInt(time_end);
		String start_donate = request.getParameter("circum_start_donate");
		String images = request.getParameter("circum_image");
		String content = request.getParameter("circum_content");
		String splitString = images.substring(3, images.length() - 6); // cắt chuỗi bỏ qua thẻ <p> và </p> do mặc định
																		// ckeditor

		Circum circum = new Circum(idP, title, type, content, splitString, des, d, t, r, te, start_donate,"active");
		circum = circumService.checkCircumByNameExist(title);
		if (circum == null) {
			try {
				circumService.insertCircum(idP, title, type, content, splitString, des, d, t, r, te, start_donate);
				_mvShareAdmin.setViewName("admin/circum/manageCircum");

			} catch (Exception e) {
				request.setAttribute("message", "Thêm mới thất bại - Tiêu đề đã tồn tại vui lòng thử lại !!!");
				_mvShareAdmin.setViewName("admin/circum/addCircum");
			}

		}
		return _mvShareAdmin;
	}
}
