package edu.zzuli.brand.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.zzuli.brand.pojo.po.Brand;
import edu.zzuli.brand.pojo.po.Demand;
import edu.zzuli.brand.service.DemandService;

/**
 * 需求表提交的Controller
 * @author 刘文豪
 *
 */
@Controller
public class DemandController {
    
	@Resource
	private DemandService demandService;
	
	@RequestMapping("insertDemand.action")
    public String insertDemand(Demand demand,Model model) throws Exception{
		demand.setDid(UUID.randomUUID().toString());
		demand.setBc(demand.getBc());
		demand.setLevel(demand.getLevel());
		demand.setEmail(demand.getEmail());
		demand.setLinkman(demand.getLinkman());
		demand.setNeed(demand.getNeed());
		demand.setQq(demand.getQq());
		demand.setTel(demand.getTel());
		demandService.insert(demand);
		return "brand_Register.jsp";
	}
}
