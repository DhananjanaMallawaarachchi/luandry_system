package com.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.service.OrderInterface;

public class CommonUtilOrder {
	public static final Logger log = Logger.getLogger(OrderInterface.class.getName());

	public static final Properties properties = new Properties();
	
	public static String generateIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = CommonConstantsOrder.ORDER_ID_PREFIX + next;
		if (arrayList.contains(id)) {
			next++;
			id = CommonConstantsOrder.ORDER_ID_PREFIX + next;
		}
		return id;
	}
	static {
		try {
			properties.load(QueryUtilOrder.class.getResourceAsStream(CommonConstantsOrder.PROPERTY_FILE));

		} catch (IOException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}
}
