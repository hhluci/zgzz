package com.seezoon.framework.common.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.Test;

public class ZxingHelperTest {
	String path = "/Users/hdf/Downloads/1.jpg";
	@Test
	public void test() throws Exception {
		ZxingHelper helper = new ZxingHelper();
		try {
			File file = new File(path);
			helper.ecnode("huangdf 黄", new FileInputStream("/Users/hdf/Downloads/avatar.png"), new FileOutputStream(path), true);
			System.out.println(helper.decode(new FileInputStream(path)));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void hascode(){
		//加密方式
		String algorithmName = "SHA-256";
		//加密字符串
		String password = "123456";
		//salt
		String salt = "rNBdNtjuefmwLGzXjHoN";
		//加密次数
		int hashIterations = 16;

		//通过SimpleHash进行加密操作
		SimpleHash hash = new SimpleHash(algorithmName, password, salt, hashIterations);

		System.out.println(hash.toString());
	}
	

}
