package controller;

import database.DataBase;
import utils.Convertor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class Controller {

    //متد هایی که نیاز دارم رو باید اینجا بنویسم

    private String buy(HashMap<String,String> data){
        String username = "";
        String balance="";
        String bookValue="";
        ArrayList<HashMap<String,String>> booklist=DataBase.getInstance().getTable("books.txt").get();
        ArrayList<HashMap<String,String>> userlist=DataBase.getInstance().getTable("users.txt").get();
        String bookname="";
        for (int i = 0; i < booklist.size(); i++) {
            var currentRow = Convertor.mapToString(booklist.get(i));
            String[] book = currentRow.split(",,");
            if (book[0].equals("book:" + username))
                bookname=book[1];
                bookValue=book[0];

        }for (int i = 0; i < booklist.size(); i++) {
            var currentRow = Convertor.mapToString(userlist.get(i));
            String[] user = currentRow.split(",,");
            if (user[0].equals("username:" + username)) {
                username = user[1];
                balance = user[2];
            }
        }
        if(Integer.parseInt(balance)<Integer.parseInt(bookValue))
            return "not enough money";
        else
            try {
                DataBase.getInstance().getTable("users").insert(Convertor.stringToMap(username+",,"+bookname));
                return "signup successful";
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    private String increase(HashMap<String,String> data) {
        String username = (data.get("username"));
        ArrayList<HashMap<String, String>> list = DataBase.getInstance().getTable("users").get();
        String result="";
        int count=0;
        for (int i = 0; i < list.size(); i++) {
            var currentRow = Convertor.mapToString(list.get(i));
            String[] user = currentRow.split(",,");
            if (user[3].equals("username:" + username))
                result=user[2];
            count=Integer.parseInt(data.get("amount"))+Integer.parseInt(data.get("count"));

        }

        return result;
    }

    private String signup(HashMap<String,String> data){
        String username=(data.get("username"));
        ArrayList<HashMap<String,String>> list=DataBase.getInstance().getTable("users.txt").get();
        ArrayList<HashMap<String,String>> finalList=new ArrayList<>();
        for (int i=0;i<list.size();i++){
            var currentRow =Convertor.mapToString(list.get(i));
            String [] user=currentRow.split(",,");
            if (user[3].equals("username:"+username))
                return "already reserved";
        }
        try {
            DataBase.getInstance().getTable("users").insert(data);
            return "signup successful";
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private String login(HashMap<String,String> data){
        String username=(data.get("username"));
        String password=(data.get("password"));
        ArrayList<HashMap<String,String>> list=DataBase.getInstance().getTable("users.txt").get();
        ArrayList<HashMap<String,String>> finalList=new ArrayList<>();
        for (int i=0;i<list.size();i++){
           var currentRow =Convertor.mapToString(list.get(i));
            String [] user=currentRow.split(",,");
            if (user[3].equals("username:"+username) && user[0].equals("password:"+password))
                return currentRow;
        }
        return "incorrect";
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
            case "increase":
                return increase(dataMap);
            case "get":
                return get(dataMap);
            case "login":
                return login(dataMap);
            case "signup":
                return signup(dataMap);
        }
        return "ERROR";
    }
}
