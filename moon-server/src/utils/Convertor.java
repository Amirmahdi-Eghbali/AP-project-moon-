package utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Convertor {
    public static HashMap<String,String> stringToMap(String str){
        //اطلاعات مختلف جدا میشن
        String[] exprs= str.split(",,");
        HashMap<String,String> data=new HashMap<>();

        //محتوای هر اطلاعات پردازش میشه
        for (String expr :exprs){
            int index=expr.indexOf(':');
            String key=expr.substring(0,index);
            String value=expr.substring(index+1);
            data.put(key,value);
        }
        return data;
    }
    public static String mapToString(HashMap<String,String> map){
        StringBuilder str=new StringBuilder();
        for (Map.Entry<String,String> entry : map.entrySet()){
            str.append(String.format("%s:%s,,",entry.getKey(),entry.getValue()));
        }
        str.delete(str.length()-2,str.length());
        return str.toString();
    }
    public static String arrMapToString(ArrayList<HashMap<String,String>>arrayList){
        StringBuilder str=new StringBuilder();
        for (HashMap<String,String> row:arrayList){
            str.append(mapToString(row)).append("\n");
        }
        return str.toString();
    }
}
