package com.booking.user.book.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.admin.book.service.CategoryService;
import com.booking.book.vo.BookVO;
import com.booking.book.vo.CategoryVO;
import com.booking.common.paging.Paging;
import com.booking.user.book.service.BookService;

@Controller
@RequestMapping(value="/book")
public class BookController {
	Logger logger = Logger.getLogger(BookController.class);
		
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private CategoryService categoryService;
	
		
	@RequestMapping(value="/bookOrder.do")
	public String bookOrder(){
		return "book/bookOrder";
	}
	

	
	//이달의 책
	@RequestMapping(value="/bookMonth.do")
	public String bookMonth(Model model){
		
		List<BookVO> monthList = bookService.monthList();
		
		model.addAttribute("monthList", monthList);
		
		return "book/bookMonth";
	}
	
	
	//index페이지로 이동
	@RequestMapping(value="/bookIndex.do")
	public String bookIndex(Model model){
		
		
		//별도 책 호출
		List<BookVO> etcbookList=bookService.etcListCall();
		
		
		//랜덤 책 3권 호출
		List<BookVO> randomList = bookService.randomList();
		
		//List<BookVO> list1=bookService.list1();
		/*List<BookVO> list2=bookService.list2();
		/*List<BookVO> list3=bookService.list3();
		List<BookVO> list4=bookService.list4();
		List<BookVO> list5=bookService.list5();*/
		
		//추천도서 호출
		List<BookVO> recommendList1 = bookService.recommendList();
		List<BookVO> recommendList2 = bookService.recommendList();
		List<BookVO> recommendList3 = bookService.recommendList();
		
		
		
		/*	model.addAttribute("list2" ,list1);
	/*	model.addAttribute("list2" ,list2);
		model.addAttribute("List3" ,list3);
		model.addAttribute("List4" ,list4);
		model.addAttribute("List5" ,list5);*/
		CategoryVO ctvo = new CategoryVO();
		List<CategoryVO> ctvoList = categoryService.categoryBoxList(ctvo);
		
		
		model.addAttribute("cateList",ctvoList);

		model.addAttribute("recommendList1", recommendList1);
		model.addAttribute("recommendList2", recommendList2);
		model.addAttribute("recommendList3", recommendList3);
		
		model.addAttribute("etcList" ,etcbookList);
		model.addAttribute("randomList", randomList);
		
		return "bookIndex";
	}
	
	//에러404 페이지로 이동
	@RequestMapping(value="/errorPage.do")
	public String errorPage(){
		return "book/error";
	}
	
	//FAQ틀
	@RequestMapping(value="/bookFAQ.do")
	public String bookFAQ(){

		return "book/bookFAQ";
	}
	
	
	
	// 책 상세보기 페이지로
	@RequestMapping(value="/bookDetail.do", method=RequestMethod.GET)
	public String bookDetail(@RequestParam String isbn, Model model, HttpServletRequest request, HttpSession session){
		logger.info("BookDetail 호출 성공");
		logger.info("isbn = " + isbn);

		
		BookVO detail = new BookVO();
		detail = bookService.bookSelect(isbn);
		
		//랜덤으로 책 추천 recommendList
		
				
		List<BookVO> recommendList1 = bookService.recommendList();
		List<BookVO> recommendList2 = bookService.recommendList();
		List<BookVO> recommendList3 = bookService.recommendList();
		
		CategoryVO ctvo = new CategoryVO();
		List<CategoryVO> ctvoList = categoryService.categoryBoxList(ctvo);	
		
		model.addAttribute("cateList",ctvoList);		
		model.addAttribute("detail", detail);
		model.addAttribute("recommendList1", recommendList1);
		model.addAttribute("recommendList2", recommendList2);
		model.addAttribute("recommendList3", recommendList3);
		session.setAttribute("id", "test");
		
		return "book/bookDetail";
	}
	
	
	@RequestMapping(value="/bookSearch", method = RequestMethod.GET)
	public String bookList(@ModelAttribute BookVO bvo, Model model, HttpServletRequest request){
		logger.info("bookSearch Called");
		
		//listData default nvl
		if(bvo.getOrderDirection() == null){
			bvo.setOrderDirection("desc");
		}
		if(bvo.getOrderTarget() == null){
			bvo.setOrderTarget("b_update");
		}
		
		Paging.setBookPaging(bvo);
		
		List<BookVO> bookList = bookService.bookList(bvo);
		bvo.setSearchTotal(bookService.bookSearchTotal(bvo));
		
		
		logger.info("searchTotal : "+bvo.getSearchTotal());
		logger.info("orderTarget : "+bvo.getOrderTarget());
		logger.info("orderDirection : "+bvo.getOrderDirection());
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("listData", bvo);
		
		CategoryVO ctvo = new CategoryVO();
		List<CategoryVO> ctvoList = categoryService.categoryBoxList(ctvo);
		model.addAttribute("cateList",ctvoList);
		//siteLogService.siteLogUpdate(request, "bookList Move", "test");

		return "book/bookSearch";
	}
	
	@ResponseBody
	@RequestMapping(value="/bookSelect", method = RequestMethod.POST)
	public BookVO bookSelect(@RequestParam String isbn, Model model){
		logger.info("bookSelect Called");
		BookVO bvo = bookService.bookSelect(isbn);
		return bvo;
	}
	
	@ResponseBody
	@RequestMapping(value="/isbnCheck", method=RequestMethod.POST)
	public String isbnCheck(@RequestParam String isbn, Model model){
		logger.info("isbnCheck Called");
		
		String result = bookService.isbnCheck(isbn);
		
		return result;
	}
}

