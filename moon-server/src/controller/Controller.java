package controller;

import database.DataBase;
import utils.Convertor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class Controller {

    //متد هایی که نیاز دارم رو باید اینجا بنویسم

    private String login(HashMap<String,String> data){
        try {
            DataBase.getInstance().getTable("users").insert(data);
            return "message successfully saved";
        } catch (IOException e) {
            return "wrong";
        }

    }
    private String getUser(HashMap<String,String> data){
        String username=(data.get("username"));
        String password=(data.get("password"));
        ArrayList<HashMap<String,String>> list=DataBase.getInstance().getTable("users").get();
        ArrayList<HashMap<String,String>> finalList=new ArrayList<>();
        for (int i=0;i<list.size();i++){
           var currentRow =Convertor.mapToString(list.get(i));
            String [] user=currentRow.split(",,");
            if (user[1].equals("username:"+username) && user[0].equals("password:"+password))
                return currentRow;
        }
        return "not found";
    }

    private String get(HashMap<String,String> data){
        int count=Integer.parseInt(data.get("count"));
        ArrayList<HashMap<String,String>> list=DataBase.getInstance().getTable("messages").get();
        ArrayList<HashMap<String,String>> finalList=new ArrayList<>();
        for (int i=list.size()-1;i>=Math.max(0,list.size()-count);i--){
            finalList.add(list.get(i));
        }
        return Convertor.arrMapToString(finalList);
    }
    private String getBy(){
        return "";
    }
    private String send(HashMap<String,String> data){
        try {
            DataBase.getInstance().getTable("messages").insert(data);
            return "message successfully saved";
        } catch (IOException e) {
            return "wrong";
        }
    }
    public String run(String command,String data){
        HashMap<String,String> dataMap= Convertor.stringToMap(data);
        switch (command){
            case "get":
                return get(dataMap);
            case "login":
                return getUser(dataMap);
            case "send":
                return send(dataMap);
        }
        return "ERROR";
    }
}
