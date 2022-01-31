package com.inhatc.cs;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.inhatc.service.FoodApiService;

@RestController
@RequestMapping("api")
public class FoodApiController {
	
	@Inject
	private FoodApiService service;
	
	@RequestMapping(value="/food_info/basic", produces="text/plain;charset=UTF-8")
	public @ResponseBody String foodBasic() throws Exception {
		// 음식 데이터를 저장하기 위해 localhost:8082/api/food_info/basic에 접근
		
		try {
			for(int pageNum=2; pageNum <= 50; pageNum++) {
				
				StringBuffer result = new StringBuffer();
				
				StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553748/CertImgListService/getCertImgListService"); 			// url
				urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=Hr%2FClOKnudYEjlnNuokdQ%2BXSEGulSw7F5aZdyer2ytDqw9V0Ru%2FqxVpZv2GuNtjW55KM2kA7Ma%2BvWFZbduECrA%3D%3D");		// Service KEY
				urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(Integer.toString(pageNum), "UTF-8"));		// 페이지 번호
				urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8"));	// 한 페이지 결과수
				urlBuilder.append("&returnType=json");		// 결과는 json 형태로 가져오기
				
				System.out.println(pageNum);
				
				URL url = new URL(urlBuilder.toString());
				
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				
				BufferedReader rd;
				
				if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				}
				
				String line;
				while ((line = rd.readLine()) != null) {
					result.append(line + "\n");
				}
				rd.close();
					conn.disconnect();
				
				service.parsingData(result.toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
}
