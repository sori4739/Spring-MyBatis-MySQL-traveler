package com.traveler.app.utils;

public class Script {
	public static String back(String msg) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("history.back();");
		sb.append("</script>");
		
		return sb.toString();
	}
	
	public static String href(String location) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("location.href='"+location+"';");
		sb.append("</script>");
		
		return sb.toString();
	}

	public static String close() {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("window.close();");
		sb.append("opener.location.reload();");
		sb.append("</script>");
		
		return sb.toString();
	}

	public static String blogLink(String link) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("window.open('"+link+"','','width=350, height=570,top=110,left=600;')");
		sb.append("</script>");
		
		return sb.toString();
	}
}