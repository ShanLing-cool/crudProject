package com.zovz.controller;

import com.zovz.domain.Role;
import com.zovz.domain.User;
import com.zovz.service.UserService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.List;

/**
 * @author ：zovz
 * @date ：Created in 2021/9/4 16:32
 * @description：
 * @version:
 */
@RequestMapping(value = "/user")
@org.springframework.stereotype.Controller
public class Controller {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ModelAndView modelAndView = new ModelAndView();
        if (userService.find(username, password)) {
            modelAndView.setViewName("redirect:/user/list");
        } else {
            modelAndView.addObject("warning", "账号或密码错误！请重新输入！");
            modelAndView.setViewName("redirect:/index.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("/saveUser")
    public ModelAndView saveUser(HttpServletRequest request) {
        String username = request.getParameter("usernameIn");
        String password = request.getParameter("passwordIn");
        System.out.println(username);
        System.out.println(password);
        Boolean flag = userService.save(username, password);
        ModelAndView modelAndView = new ModelAndView();
        if (flag) {
            modelAndView.addObject("success", "注册成功！");
            modelAndView.setViewName("redirect:/index.jsp");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/list")
    public ModelAndView list() {
        List<Role> roleList = userService.list();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("roleList", roleList);
        modelAndView.setViewName("userList");
        return modelAndView;
    }

    @RequestMapping("/saveRole")
    public String save(HttpServletRequest request) {
        String roleName = request.getParameter("roleName");
        String password = request.getParameter("rolePhone");
        String roleIdentity = request.getParameter("roleIdentity");
        userService.saveRole(roleName, password, roleIdentity);
        return "redirect:/user/list";
    }

    @RequestMapping("/deleteRole")
    public String deleteRole(HttpServletRequest request) {
        String id = request.getParameter("id");
        userService.deleteRole(id);
        return "redirect:/user/list";
    }

    @ResponseBody
    @RequestMapping("/getImage")
    public String getImage() throws IOException {
        String url = "https://cn.bing.com/?mkt=zh-CN";
        Document document = Jsoup.parse(new URL(url), 30000);
        //3.得到图片
        Element vs_cont = document.getElementById("vs_cont");
        Elements downloadLink = vs_cont.getElementsByClass("downloadLink");
        String[] split = downloadLink.toString().split("\"");
        return "https://cn.bing.com/" + split[1];
    }
}
