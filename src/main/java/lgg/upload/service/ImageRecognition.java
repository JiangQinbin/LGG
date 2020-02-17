package lgg.upload.service;

import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;

import com.baidu.aip.ocr.AipOcr;

public class ImageRecognition {
	public static final String APP_ID = "16017036";
    public static final String API_KEY = "L4OU3nHlQnzjTSg4wB8GzXPV";
    public static final String SECRET_KEY = "ucn2MjR1U1u41ctwTT249k5izjd0gs4v";
    public static JSONArray recognition(String path) {
		AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);

        // 可选：设置网络连接参数
        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);

        // 可选：设置代理服务器地址, http和socket二选一，或者均不设置
        //client.setHttpProxy("proxy_host", proxy_port);  // 设置http代理
        //client.setSocketProxy("proxy_host", proxy_port);  // 设置socket代理

        // 可选：设置log4j日志输出格式，若不设置，则使用默认配置
        // 也可以直接通过jvm启动参数设置此环境变量
        // System.setProperty("aip.log4j.conf", "path/to/your/log4j.properties");

        // 调用接口
        JSONObject res = client.basicGeneral(path, new HashMap<String, String>());
        JSONArray jsonArray = res.getJSONArray("words_result");
        return jsonArray;
    }

}
