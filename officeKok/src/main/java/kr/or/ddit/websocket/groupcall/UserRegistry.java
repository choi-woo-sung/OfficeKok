/*
 * (C) Copyright 2014 Kurento (http://kurento.org/)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package kr.or.ddit.websocket.groupcall;

import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.WebSocketSession;

/**
 * Map of users registered in the system. This class has a concurrent hash map to store users, using
 * its name as key in the map.
 * 
 * @author Boni Garcia (bgarcia@gsyc.es)
 * @author Micael Gallego (micael.gallego@gmail.com)
 * @authos Ivan Gracia (izanmail@gmail.com)
 * @since 4.3.1
 */
public class UserRegistry {
	//HashMap을 thread-safe 하도록 만든 클래스가 ConcurrentHashMap입니다. 하지만 HashMap과는 다르게 key, value에 null을 허용하지 않습니다. 
	//또한 putIfAbsent라는 메소드를 가지고 있습니다. 해당 부분은 아래 코드의 주석을 참고하시기 바랍니다.
	//이와 비슷한 리스트로는 SyncronizedList가 있다고 한다.
  private final ConcurrentHashMap<String, UserSession> usersByName = new ConcurrentHashMap<>();
  private final ConcurrentHashMap<String, UserSession> usersBySessionId = new ConcurrentHashMap<>();

  public void register(UserSession user) {
	  
	  //유저와 세션아이디를 등록한다.
    usersByName.put(user.getName(), user);
    usersBySessionId.put(user.getSession().getId(), user);
  }

  public UserSession getByName(String name) {
    return usersByName.get(name);
  }

  public UserSession getBySession(WebSocketSession session) {
    return usersBySessionId.get(session.getId());
  }

  public boolean exists(String name) {
    return usersByName.keySet().contains(name);
  }

  public UserSession removeBySession(WebSocketSession session) {
    final UserSession user = getBySession(session);
    usersByName.remove(user.getName());
    usersBySessionId.remove(session.getId());
    return user;
  }

}
