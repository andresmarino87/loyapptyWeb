/*
 * 
 *   Autor: Andrés Mariño
 * 
 * */

package loyapptyWeb;

import java.io.*;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
//import java.util.ArrayList;
import java.util.List;
import org.codehaus.jettison.json.JSONObject;
import org.codehaus.jettison.json.JSONArray;

//import org.xml.sax.InputSource;

//import bsh.This;

//	import com.sun.xml.bind.v2.model.core.Element;

public class Xml {

	// Recibe un String con el XML y el tag que se desea leer en un primer nivel
	public String[] getTagsContent(String xml, String[] tags) {
		SAXBuilder builder = new SAXBuilder();
		String[] res = null;
		try {
			// Se arma el XML
			Document doc = builder.build(new ByteArrayInputStream(xml.getBytes()));
			Element aux = doc.getRootElement();
			res = new String[(tags.length - 1)];
			// Se busca el tag especifico
			for (int i = 0; i < tags.length - 1; i++) {
				res[i] = aux.getChildText(tags[i]);
			}
			return res;
		} catch (JDOMException Je) {
			res = new String[1];
			res[0] = "Jdom";
			return res;
		} catch (IOException IOe) {
			res = new String[1];
			res[0] = "IOE";
			return res;
		}
	}

	// Recibe un String con el XML y el tag que se desea leer en un segundo
	// nivel
	public String[] getTagsContent2(String xml, String[] tags) {
		SAXBuilder builder = new SAXBuilder();
		String[] res = null;
		try {
			// Se arma el XML
			Document doc = builder.build(new ByteArrayInputStream(xml.getBytes()));
			Element aux = doc.getRootElement().getChild(tags[tags.length - 1]);
			// System.out.println(doc.getRootElement().getChild(tags[(tags.length)-1]).getChildText("name"));
			res = new String[(tags.length - 1)];
			// Se busca el tag especifico
			for (int i = 0; i < tags.length - 1; i++) {
				res[i] = aux.getChildText(tags[i]);
			}
			return res;
		} catch (JDOMException Je) {
			res = new String[1];
			res[0] = "Jdom";
			return res;
		} catch (IOException IOe) {
			res = new String[1];
			res[0] = "IOE";
			return res;
		}
	}

	// Recibe un String con el XML y el tag que se desea leer y devuelve una
	// matriz en un tercer nivel

	public String[][] getTagsContentMatrix(String xml, String[] tags) {
		SAXBuilder builder = new SAXBuilder();
		String[][] res = null;
		try {
			// Se arma el XML
			Document doc = builder.build(new ByteArrayInputStream(xml.getBytes()));
			List<Element> list = doc.getRootElement().getChild(tags[tags.length - 2]).getChildren(tags[tags.length - 1]);
			res = new String[list.size()][(tags.length - 2)];
			int i = 0;
			// se busca la lista de tags
			for (Element element : list) {
				// Se busca el tag especifico
				for (int j = 0; j < tags.length - 2; j++) {
					if(element.getChildText(tags[j]) == null){
						res[i][j] ="";
					}else{
						res[i][j] = element.getChildText(tags[j]);						
					}
				}
				i++;
			}
			return res;
		} catch (JDOMException Je) {
			res = new String[1][1];
			res[0][0] = "Error " + Je;
			Je.printStackTrace();
			return res;
		} catch (IOException IOe) {
			res = new String[1][1];
			res[0][0] = "Error " + IOe;
			IOe.printStackTrace();
			return res;
		}
	}	
}