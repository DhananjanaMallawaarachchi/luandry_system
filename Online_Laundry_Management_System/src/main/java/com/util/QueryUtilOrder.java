package com.util;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class QueryUtilOrder extends CommonUtilOrder {
	public static String queryByID(String id) throws SAXException, IOException, ParserConfigurationException {

		NodeList nodeList;
		Element element = null;
		
//		String filePath = System.getProperty("catalina.base")
//                + "\\wtpwebapps\\Online_Laundry_Management_System\\WEB-INF\\OrderQuery.xml";
//		
//		File xmlFile = new File(filePath);
//        if (!xmlFile.exists()) {
//            System.out.println("File not found: " + filePath);
//            return null;
//        } else {
//            System.out.println("File found: " + filePath);
//        }
        
		nodeList = DocumentBuilderFactory.newInstance().newDocumentBuilder()
				.parse(new File(System.getProperty("catalina.base")
						+ "\\wtpwebapps\\Online_Laundry_Management_System\\WEB-INF\\OrderQuery.xml"))
				.getElementsByTagName(CommonConstantsOrder.TAG_NAME);

		for (int value = 0; value < nodeList.getLength(); value++) {
			element = (Element) nodeList.item(value);
			if (element.getAttribute(CommonConstantsOrder.ATTRIB_ID).equals(id))
				break;
		}
		
//		System.out.println("Printing NodeList items:");
//        for (int value = 0; value < nodeList.getLength(); value++) {
//            element = (Element) nodeList.item(value);
//            System.out.println("Item " + value + ": " + element.getAttribute(CommonConstantsOrder.ATTRIB_ID));
//        }
        
		return element.getTextContent().trim();
	}
}
