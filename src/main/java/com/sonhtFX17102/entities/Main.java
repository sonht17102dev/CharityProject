package com.sonhtFX17102.entities;

import org.apache.commons.codec.digest.DigestUtils;

public class Main {
	public static void main(String args[]) {
		String hash = "900150983CD24FB0D6963F7D28E17F72";
		String password = "abc";
	
		String md5Hex = DigestUtils.md5Hex(password).toUpperCase();
		System.out.println("Hash: " + md5Hex);
		System.out.println("Verify: " + hash.equals(md5Hex));
	}
}
