package database;

import java.util.HashMap;

public class DataBase {
    private static DataBase instance=null;
    private HashMap<String,Table> tables;
    private DataBase(){
        tables=new HashMap<>();
        tables.put("users",new Table("src/data/users.txt"));

    }

    public static DataBase getInstance(){
        if (instance==null)
            instance=new DataBase();

        return instance;
    }
    public Table getTable(String name){
        return tables.get(name);
    }
}
