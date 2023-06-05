package main.java.com.lec.jdbc.vo;


public class CategoryVO {

    private int id;
    private int user_id;
    private String type;
    private String name;

    public CategoryVO() {
    }


    public CategoryVO(int id, String type, String name) {
        this.id = id;
        this.type = type;
        this.name = name;
    }


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

    // Getter, Setter, toString 등 필요한 메소드들

}