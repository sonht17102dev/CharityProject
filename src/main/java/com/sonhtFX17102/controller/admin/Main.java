package com.sonhtFX17102.controller.admin;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		String input = "<img alt=\"\" src=\"https://static.mservice.io/blogscontents/momo-upload-api-230112141333-638091296130777561.jpg\" style=\"height:630px; width:1182px\" /><img alt=\"\" src=\"https://static.mservice.io/blogscontents/momo-upload-api-230112142018-638091300180814922.jpg\" style=\"height:630px; width:1182px\" />";
		Scanner sc = new Scanner(System.in);
		String input = sc.nextLine();
//		String r = splitImage(input);
		
		
		// In kết quả
		System.out.println(replaceStyle(input));
		sc.close();
	}
	static String replaceStyle(String input) {
		return input.replaceAll("style=\"[^\"]*\"", "");
	}
	static String splitImage(String input) {
		String result = "";
		// Tìm vị trí đầu tiên của thẻ <img>
		int firstImgTagIndex = input.indexOf("<img");

		// Tìm vị trí của ký tự '>' sau thẻ <img> đầu tiên
		int closingBracketIndex = input.indexOf(">", firstImgTagIndex);

		// Kiểm tra xem có tìm thấy thẻ <img> và ký tự '>' hay không
		if (firstImgTagIndex != -1 && closingBracketIndex != -1) {
		    // Lấy chuỗi con chứa thẻ <img> đầu tiên
		    result = input.substring(firstImgTagIndex, closingBracketIndex + 1);
		    
		    // In kết quả
		    System.out.println(result);
		} else {
		    System.out.println("Không tìm thấy thẻ <img> hoặc ký tự '>' trong chuỗi.");
		}
		return result;
	}
	
}
