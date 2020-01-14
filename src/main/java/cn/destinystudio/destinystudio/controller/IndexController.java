package cn.destinystudio.destinystudio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index(Model model) {
        return "index";
    }

    @RequestMapping("/donate")
    public String donate() {
        return "donate";
    }

    @RequestMapping("/tip")
    public String tip(Model model,
                      @RequestParam(required = false, value = "msg", defaultValue = "提示") String msg,
                      @RequestParam(required = false, value = "ps", defaultValue = "") String ps,
                      @RequestParam(required = false, value = "toLogin") String toLogin,
                      @RequestParam(required = false, value = "toIndex") String toIndex,
                      @RequestParam(required = false, value = "toBack") String toBack) {
        model.addAttribute("msg", msg);
        if (ps != null && !ps.equals("")) {
            model.addAttribute("ps", ps);
        }
        model.addAttribute("toLogin", toLogin);
        model.addAttribute("toIndex", toIndex);
        model.addAttribute("toBack", toBack);
        return "common/tip";
    }

    @RequestMapping("/tipUnlogin")
    public String tipUnlogin(Model model) {
        model.addAttribute("msg", "请登录查看！");
        model.addAttribute("toLogin", true);
        model.addAttribute("toIndex", true);
        return "common/tip";
    }
}
