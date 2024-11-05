package dbmsMiniProj;

public class Event {
	private String category;
	private String name;
	private String city;
	private int totSeats;
	private int availableSeats;
	private double price;
	
	
	public Event(String category, String name, String city, int totSeats, int availableSeats, double price) {
		super();
		this.category = category;
		this.name = name;
		this.city = city;
		this.totSeats = totSeats;
		this.availableSeats = availableSeats;
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getTotSeats() {
		return totSeats;
	}
	public void setTotSeats(int totSeats) {
		this.totSeats = totSeats;
	}
	public int getAvailableSeats() {
		return availableSeats;
	}
	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
}
