import java.util.ArrayList;
import java.util.List;

public class Person {
    private String name;
    private String password;
    private long ID;
    List<Book> books=new ArrayList<>();
    private int balance;

    public Person(String name, String password, long ID) {
        this.name = name;
        this.password = password;
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }
}
