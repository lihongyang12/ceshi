package com.lhy.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lhy.entity.Book;
import com.lhy.entity.Press;
import com.lhy.mapper.BookMapper;
import com.lhy.util.PageUtil;

@Controller
public class BookController {
	
	@Autowired
	private BookMapper bookMapper;
	
	@RequestMapping("list")
	public String list(Model model,String lname,String start,String end,String page){
		int count = bookMapper.count(lname, start, end);
		PageUtil pageUtil = new PageUtil(page,5,count);
		List<Book> blist = bookMapper.blist(pageUtil, lname, start, end);
			System.out.println(blist);
		model.addAttribute("blist",blist);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		model.addAttribute("pageUtil",pageUtil);
		
		return "list";
	}
	
	@RequestMapping("toadd")
	public String toadd(Model model){
		model.addAttribute(new Book());
		List<Press> plist = bookMapper.plist();
		model.addAttribute("plist",plist);
		return "add";
	}
	
	@RequestMapping("add")
	public String add(Model model,Book book,MultipartFile pic,HttpServletRequest request){
			
		if(pic!=null){
		//路径
				String path = request.getServletContext().getRealPath("resources/upload");
				//创建格式
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				
				String newFilename  = sdf.format(new Date())+pic.getOriginalFilename();
				File file = new File(path+File.separator+newFilename);
				
				try {
					FileUtils.copyInputStreamToFile(pic.getInputStream(), file);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
				book.setPhoto(newFilename);
		}
				if(bookMapper.add(book)==1){
					return "redirect:list";
				}else{
					model.addAttribute("mess","添加失败");
					return "add";
				}
		   }
	
}
