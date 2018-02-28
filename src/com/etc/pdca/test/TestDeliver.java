package com.etc.pdca.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.etc.pdca.entity.Deliver;
import com.etc.pdca.entity.Project;
import com.etc.pdca.service.DeliverService;
import com.etc.pdca.service.ProjectService;

public class TestDeliver {
	static DeliverService deliverService= new DeliverService();
	static ProjectService projectService= new ProjectService();
	public static void main(String[] args){
		Deliver deliver = new Deliver();
		Date date = new Date();
		System.out.println("2313213");
		Project deliverproject = projectService.getProjectByID(2);
		System.out.println("deliverproject="+deliverproject.toString());
		deliver.setDispatcher("王建");
		deliver.setReceiver("张文山");
		deliver.setProjectId(deliverproject);
		deliver.setPublishTime(date);
		deliver.setContent("哼哼哈恒");
		deliverService.addDeliver(deliver);
		List<Deliver> delivers = deliverService.getDeliverlist();
		System.out.println(delivers.toString());
		delivers.clear();
		delivers = deliverService.getDeliverbyProjectId(2);
		System.out.println(delivers.toString());
	}
}
