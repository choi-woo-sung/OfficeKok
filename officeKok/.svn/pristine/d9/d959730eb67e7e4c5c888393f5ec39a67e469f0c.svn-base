package kr.or.ddit.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.web.socket.WebSocketSession;

public class SycronizedBeanFactory implements FactoryBean<List<WebSocketSession>>{

	private  List<WebSocketSession> list = new ArrayList<WebSocketSession>(); 
	@Override
	public List<WebSocketSession> getObject() throws Exception {
		// TODO Auto-generated method stub
		return Collections.synchronizedList(list);
	}

	@Override
	public Class<?> getObjectType() {
		// TODO Auto-generated method stub
		return List.class;
	}

	@Override
	public boolean isSingleton() {
		// TODO Auto-generated method stub
		return true;
	}

}
