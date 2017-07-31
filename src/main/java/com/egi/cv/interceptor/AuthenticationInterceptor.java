/**
 * 
 */
package com.egi.cv.interceptor;

import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.egi.cv.model.Users;

/**
 * @author egi
 * 
 */
public class AuthenticationInterceptor implements HandlerInterceptor {

    private static final Logger log = (Logger) Logger
	    .getLogger(AuthenticationInterceptor.class);

    /*
     * (non-Javadoc)
     * 
     * @see
     * org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax
     * .servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
     * java.lang.Object, java.lang.Exception)
     */
    @Override
    public void afterCompletion(HttpServletRequest arg0,
	    HttpServletResponse arg1, Object arg2, Exception arg3)
	    throws Exception {
	log.debug("After-completion");

    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet
     * .http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
     * java.lang.Object, org.springframework.web.servlet.ModelAndView)
     */
    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
	    Object arg2, ModelAndView arg3) throws Exception {
	log.debug("Post-handle");

    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet
     * .http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
     * java.lang.Object)
     */
    @Override
    public boolean preHandle(HttpServletRequest request,
	    HttpServletResponse response, Object handler) throws Exception {
	log.info("Interceptor: Pre-handle");

	// Avoid a redirect loop for some urls
	// if (!request.getRequestURI().equals("/News/login")) {
	Users userData = (Users) request.getSession().getAttribute(
		"LOGGEDIN_USER");
	if (userData == null) {
	    response.sendRedirect("/BookingManagement/login");
	    return false;
	}
	// }
	return true;
    }

}
