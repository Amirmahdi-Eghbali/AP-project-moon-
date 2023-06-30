import java.util.ArrayList;
import java.util.List;

public class Book {
    private String name;
    private int price;
    private int date;
    private boolean type;
    private String description;


    private String imagePath;
    int rate;
    List<Book> storeBook=new ArrayList<>();

    List<String> comments=new ArrayList<>();

    public Book(String name, int price, int date, boolean type, String imagePath) {
        this.name = name;
        this.price = price;
        this.date = date;
        this.type = type;
        this.imagePath = imagePath;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }


}
