/**
 *
 */
package com.egi.cv.controller;

import com.egi.cv.helper.BookFlight;
import com.egi.cv.model.Booking;
import com.egi.cv.model.Flight;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.egi.cv.model.Users;
import com.egi.cv.service.BookingService;
import com.egi.cv.utility.PwdEncryptor;
import java.util.Date;

/**
 * @author egi
 *
 */
@Controller
public class BMController {

    private static final Logger logger = Logger
            .getLogger(BMController.class);
    @Autowired
    private BookingService bookService;
    @Autowired
    private MessageSource messageSource;
    @Autowired
    ServletContext context;

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public ModelAndView login(ModelAndView model, HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        try {
            Users users = new Users();
            model.addObject("usersBean", users);
            model.setViewName("login");
        } catch (Exception e) {

        }
        return model;
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    public ModelAndView executeLogin(ModelAndView model,
            HttpServletRequest request, HttpServletResponse response,
            @ModelAttribute("usersBean") Users users, @Valid Users usersBean,
            BindingResult result, RedirectAttributes redirectAttr)
            throws IOException {
        try {
            if (result.hasErrors()) {
                logger.info("HAS ERRORS");
                for (Object object : result.getAllErrors()) {
                    if (object instanceof FieldError) {
                        FieldError fieldError = (FieldError) object;
                        redirectAttr.addFlashAttribute(fieldError.getField(),
                                messageSource.getMessage(fieldError, null));

                        logger.info("fieldError-> " + fieldError.getField());
                        logger.info("Message -> "
                                + messageSource.getMessage(fieldError, null));
                    }
                }
                redirectAttr.addFlashAttribute("messageFailed", "LOGIN FAILED");
                model.setViewName("redirect:login");
                return model;
            }

            request.getSession().setAttribute("LOGGEDIN_USER", users);
            request.getSession().setAttribute("userLogin",
                    users.getUsername());
            Users u = bookService.findUsersByUserName(users.getUsername());
            if (u == null) {
                redirectAttr.addFlashAttribute("messageFailed",
                        "LOGIN FAILED USER OR PASSWORD NOT MATCH");
                model.setViewName("redirect:login");
                return model;
            }
            logger.info("PASSWORD : "+PwdEncryptor.encrypt(users.getPassword()));
            if (!u.getPassword().equals(PwdEncryptor.encrypt(users.getPassword()))) {
                redirectAttr.addFlashAttribute("messageFailed",
                        "Invalid Password");
                model.setViewName("redirect:login");
                return model;
            }
            redirectAttr.addFlashAttribute("messageSuccess", "LOGIN SUCCESS");
            model.setViewName("redirect:login/index");
            logger.info("SUCCESS LOGIN");

        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return model;
    }

    @RequestMapping(value = {"/login/index"}, method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model,
            @RequestParam Map<String, String> pathVariablesMap,
            HttpServletRequest req) throws IOException {
        try {
            model.setViewName("admin/content");
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return model;
    }

    @RequestMapping(value = {"/index/bookflight"}, method = RequestMethod.GET)
    public ModelAndView BookFlight(ModelAndView model,
            @RequestParam Map<String, String> requestParams,
            HttpServletRequest req, HttpServletResponse response, RedirectAttributes redirectAttr) throws IOException {
        try {
            String type = requestParams.get("flightId");
            if (null == type) {
                redirectAttr.addFlashAttribute("messageFailed",
                        "Flight ID cant be null");
                model.setViewName("redirect:book");
                return model;
            }
            Flight flight = bookService.findFlightById(Integer.valueOf(type));
            if (null == flight) {
                redirectAttr.addFlashAttribute("messageFailed",
                        "Flight Not Found");
                model.setViewName("redirect:book");
                return model;
            }
            model.addObject("flight", flight);
            model.addObject("bookFlight", new BookFlight());
            model.setViewName("admin/bookflight");
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return model;
    }

    @RequestMapping(value = "/index/bookflight", method = RequestMethod.POST)
    public ModelAndView addBooking(@ModelAttribute("bookFlight") @Valid BookFlight flight,
            BindingResult result, SessionStatus status,
            RedirectAttributes redirectAttr) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            logger.info("Save New Booking");
            Flight fl = bookService.findFlightById(flight.getFlightId());
            Booking booking = new Booking();
            //booking.setBookId(null); Booking set by serial
            booking.setBookTimestamp(new Date());
            booking.setCustomerName(flight.getCustName());
            booking.setTotalPassenger(Integer.valueOf(flight.getTotalSeats()));
            booking.setFlightId(fl);
            bookService.saveBooking(booking);
            
            //Update Fligh Seats Available
            fl.setSeats(fl.getSeats() - Integer.valueOf(flight.getTotalSeats()));
            bookService.updateFlight(fl);
            redirectAttr.addFlashAttribute("messageSuccess", "ADD BOKING DATA SUCCESS");
            modelAndView.setViewName("redirect:/index/booklist");
    
        } catch (Exception e) {
            logger.error(e.getMessage());
        }

        return modelAndView;

    }

    @RequestMapping(value = {"/index/book"}, method = RequestMethod.GET)
    public ModelAndView booknow(ModelAndView model,
            @RequestParam Map<String, String> requestParams,
            HttpServletRequest req) throws IOException {
        try {
            PagedListHolder<Flight> flightList = null;
            String type = requestParams.get("type");
            if (null == type) {
                // First Request, Return first set of list
                flightList = new PagedListHolder<Flight>();
                flightList.setSource(bookService.getAllFlight());
                flightList.setPageSize(6);
                req.getSession().setAttribute("flightList", flightList);
                printPageDetails(flightList);
            } else if ("next".equals(type)) {
                // Return next set of list
                flightList = (PagedListHolder<Flight>) req.getSession()
                        .getAttribute("flightList");
                flightList.nextPage();
                printPageDetails(flightList);
            } else if ("prev".equals(type)) {
                // Return previous set of list
                flightList = (PagedListHolder<Flight>) req.getSession()
                        .getAttribute("flightList");
                flightList.previousPage();
                printPageDetails(flightList);
            } else {
                // Return spesific index set of list
                logger.info("type -> " + type);
                flightList = (PagedListHolder<Flight>) req.getSession()
                        .getAttribute("flightList");
                int pageNum = Integer.parseInt(type);
                flightList.setPage(pageNum);
                printPageDetails(flightList);
            }
            model.setViewName("admin/booknow");
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return model;
    }

    @RequestMapping(value = "/index/deletebook", method = RequestMethod.GET)
    public ModelAndView deleteBook(HttpServletRequest request,
            RedirectAttributes redirectAttr) {
        try {
            Booking book = bookService.findBookingById(Integer.parseInt(request
                    .getParameter("bookId").toString()));
            bookService.deleteBooking(book);
            redirectAttr.addFlashAttribute("messageSuccess", "DELETE DATA SUCCESS");
        } catch (Exception e) {
            redirectAttr.addFlashAttribute("messageFailed", "DELETE DATA FAILED");
            logger.error(e.getMessage());
        }
        return new ModelAndView("redirect:/index/booklist");
    }

    @RequestMapping(value = {"/index/booklist"}, method = RequestMethod.GET)
    public ModelAndView booklist(ModelAndView model,
            @RequestParam Map<String, String> requestParams,
            HttpServletRequest req) throws IOException {
        try {
            PagedListHolder<Booking> bookList = null;
            String type = requestParams.get("type");
            String cstName = requestParams.get("cstName");
            if (null == type) {
                // First Request, Return first set of list
                bookList = new PagedListHolder<Booking>();
                if (null != cstName) {
                    bookList.setSource(bookService.getByCustName(cstName));
                } else {
                    bookList.setSource(bookService.getAllBooking());
                }
                System.out.println(" num size :" + bookList.getSource().size());
                bookList.setPageSize(6);
                req.getSession().setAttribute("bookList", bookList);
                printPageDetails(bookList);
            } else if ("next".equals(type)) {
                // Return next set of list
                bookList = (PagedListHolder<Booking>) req.getSession()
                        .getAttribute("bookList");
                bookList.nextPage();
                printPageDetails(bookList);
            } else if ("prev".equals(type)) {
                // Return previous set of list
                bookList = (PagedListHolder<Booking>) req.getSession()
                        .getAttribute("bookList");
                bookList.previousPage();
                printPageDetails(bookList);
            } else {
                // Return spesific index set of list
                logger.info("type -> " + type);
                bookList = (PagedListHolder<Booking>) req.getSession()
                        .getAttribute("bookList");
                int pageNum = Integer.parseInt(type);
                bookList.setPage(pageNum);
                printPageDetails(bookList);
            }
            model.setViewName("admin/booklist");
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return model;
    }

    @RequestMapping(value = "/login/index/logout", method = RequestMethod.POST)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    private void printPageDetails(PagedListHolder pageList) {

        logger.info("curent page :" + pageList.getPage());

        logger.info("Total Num of pages :"
                + pageList.getPageCount());

        logger.info("is First page :"
                + pageList.isFirstPage());

        logger.info("is Last page :"
                + pageList.isLastPage());
    }

}
