package com.seezoon.framework.common.context.support;

import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.seezoon.framework.common.context.beans.ResponeModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.converter.HttpMessageNotWritableException;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

/**
 * 实现国际化，信息标准转化输出
 *
 * 为提供标准输出，在定义Controller返回值时 使用ResponeModel类作为标准输出
 * 输出时请自定义输出内容 responeCode 必填  最好为 language_**.properties 文件中定义的
 *                    responeMsg （可以自定义）若responeCode为已存在则该字段无需定义
 *					  data  存放返回前端解析数据
 *					  responeCode 建议使用 language_**.properties 文件中定义的或者在文件中自定义
 *					  responeMsg  使用language_**.properties 文件中responeCode对应的值
 *
 *  国际化中需要向后台的请求头中添加标准的Accept-Language信息
 * 
 * @author hdf 2018年3月31日
 */
public class SeezoonFastJsonHttpMessageConverter extends FastJsonHttpMessageConverter {

	/**
	 * 消息资源文件
	 */
	@Autowired
	private MessageSource messageSource;

	@Override
	protected void writeInternal(Object obj, HttpOutputMessage outputMessage)
			throws IOException, HttpMessageNotWritableException {
		if (null != obj && obj instanceof ResponeModel) {
			ResponeModel responeModel = (ResponeModel) obj;
			String responeCode = responeModel.getResponeCode();
			String msg = messageSource.getMessage(responeCode, responeModel.getParams(), responeModel.getResponeMsg(),
					this.getLocale(outputMessage));
			responeModel.setResponeMsg(msg);
		}
		super.writeInternal(obj, outputMessage);
	}



	/**
	 * 如果要实现国际化，改变这个方法的返回值即可，可以通过Filter设置ThreadLocal传入国际化参数
	 * 
	 * @return
	 */
	protected Locale getLocale(HttpOutputMessage outputMessage) {
		String language = outputMessage.getHeaders().get("language").get(0);
		String country = outputMessage.getHeaders().get("country").get(0);
		return new Locale(language, country);
	}
}
