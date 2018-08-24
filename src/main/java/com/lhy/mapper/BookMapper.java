package com.lhy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lhy.entity.Book;
import com.lhy.entity.Press;
import com.lhy.util.PageUtil;

@Mapper
public interface BookMapper {
	
	List<Book> blist(@Param("pageUtil") PageUtil pageUtil,@Param("lname") String lname,@Param("start")String start,@Param("end") String end);

	int count(@Param("lname") String lname,@Param("start")String start,@Param("end") String end);

	List<Press> plist();
	
	int add(Book book);
}
