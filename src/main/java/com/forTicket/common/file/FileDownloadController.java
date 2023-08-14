package com.forTicket.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static String THEATER_IMAGE_REPO = "C:\\forTicket\\theater";
	private static String GOODS_IMAGE_REPO = "C:\\forTicket\\goods";
	private static String EVENT_IMAGE_REPO = "C:\\forTicket\\event";
	
	@RequestMapping("/theater/download.do")
	protected void t_download(@RequestParam("theater_image") String theater_image, @RequestParam("theater_id") int theater_id, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		OutputStream out = resp.getOutputStream();
		String downFile = THEATER_IMAGE_REPO + "\\" + theater_id+"\\"+theater_image;
		File file = new File(downFile);
		resp.setHeader("Cache-Control", "no-cache");
		resp.addHeader("Content-disposition", "attachment: fileName="+theater_image);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count==-1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/goods/download.do")
	protected void g_download(@RequestParam("goods_image") String goods_image, @RequestParam("goods_id") int goods_id, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		OutputStream out = resp.getOutputStream();
		String downFile = GOODS_IMAGE_REPO + "\\" + goods_id+"\\"+goods_image;
		File file = new File(downFile);
		resp.setHeader("Cache-Control", "no-cache");
		resp.addHeader("Content-disposition", "attachment: fileName="+goods_image);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count==-1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/event/download.do")
	protected void e_download(@RequestParam("event_image") String event_image, @RequestParam("event_id") int event_id, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		OutputStream out = resp.getOutputStream();
		String downFile = EVENT_IMAGE_REPO + "\\" + event_id+"\\"+event_image;
		File file = new File(downFile);
		resp.setHeader("Cache-Control", "no-cache");
		resp.addHeader("Content-disposition", "attachment: fileName="+event_image);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count==-1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
