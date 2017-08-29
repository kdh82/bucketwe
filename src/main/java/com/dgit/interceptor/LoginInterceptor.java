package com.dgit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dgit.domain.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		UserVO loginVO = (UserVO)modelAndView.getModel().get("loginVO");   //여기 loginVO와 BucUserController에 POST에 model.addAttribute("loginVO", vo);에
																						// loginVO이름이 같아야함
		System.out.println("userVO========"+loginVO);
		if (loginVO == null) {
			response.sendRedirect("login");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute(LOGIN, loginVO.getId());            ///////여기에서 보면 위에 login이라서 ${login}하고 파라미터값 따로 적지 않아야됨

			String path = (String)session.getAttribute("dest");
			if (path != null) {
				response.sendRedirect(path);
			}
		}
	}
}
