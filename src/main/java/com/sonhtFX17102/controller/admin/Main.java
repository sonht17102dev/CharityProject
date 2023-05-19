package com.sonhtFX17102.controller.admin;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String input = "<img alt=\"\" src=\"https://static.mservice.io/blogscontents/momo-upload-api-230112141333-638091296130777561.jpg\" style=\"height:630px; width:1182px\" />";
		String output = input.replaceAll("style=\"[^\"]*\"", "");

		System.out.println(output);

	}

}
