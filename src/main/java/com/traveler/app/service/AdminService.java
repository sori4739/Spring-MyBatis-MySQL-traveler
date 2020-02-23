package com.traveler.app.service;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.Gson;
import com.traveler.app.model.Blog;
import com.traveler.app.model.Channel;

@Service
public class AdminService {
   
   //크롤링한 이미지 Jsoup파싱!
	public static String isPriviewImg(String bloglink) throws Exception {

	      String link = bloglink;
	      String[] link2 = link.split("/");
	      String[] id = link2[3].split("\\?");
	      String[] link3 = link2[3].split("&");
	      String url = "https://blog.naver.com/PostView.nhn?blogId=" + id[0] + "&" + link3[1]
	            + "&redirect=Dlog&widgetTypeCall=true&directAccess=false";

	      Document doc = Jsoup.connect(url).get();
	      try {
	         Element contentElement = doc.getElementById("postListBody");
	         Elements imageElements = contentElement.getElementsByTag("img");
//	          System.out.println("img :"+imageElements);
//	         String pre = imageElements.get(4).attr("src");
	         String pre = imageElements.get(0).attr("src");
	         String[] pre2 = pre.split("\\?");

//	          System.out.println("pre :"+pre);
	         return pre2[0];
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	   }

   public Channel isCrawling(String value, Model model) {

      Gson gson = new Gson();

      String result = NaverBlogAPI.crawling(value + "");
      Channel channel = new Channel();
      channel = gson.fromJson(result, Channel.class);
      
      //파싱한이미지 모델이 담기!
      try {
         for (Blog i : channel.getItems()) {
            String bloglink = i.getLink();
            String previewImg = AdminService.isPriviewImg(bloglink);
            i.setPreviewImg(previewImg);

         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return channel;
   }
}