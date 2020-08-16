package model;

public class memberVO {
	private String id;
	private String password;
	private String name;
	private String email;
	   
	private String address;
	private String status;
	private String cls;
	private int score;
	
	
	   
	@Override
	public String toString() {
		return "memberVO [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", address="
				+ address + ", status=" + status + ", cls=" + cls + ", score=" + score + "]";
	}

	public memberVO() {};

	public memberVO(String id, String name, String email, String password, String address, String status, String cls, int score) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.status = status;
		this.cls = cls;
		this.score = score;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getId() {
	      return id;
	   }

	   public void setId(String id) {
	      this.id = id;
	   }

	   public String getPassword() {
	      return password;
	   }

	   public void setPassword(String password) {
	      this.password = password;
	   }

	   public String getName() {
	      return name;
	   }

	   public void setName(String name) {
	      this.name = name;
	   }

	   public String getEmail() {
	      return email;
	   }

	   public void setEmail(String email) {
	      this.email = email;
	   }

	   public String getAddress() {
	      return address;
	   }

	   public void setAddress(String address) {
	      this.address = address;
	   }

	   public String getStatus() {
	      return status;
	   }

	   public void setStatus(String status) {
	      this.status = status;
	   }

	   public String getCls() {
	      return cls;
	   }

	   public void setCls(String cls) {
	      this.cls = cls;
	   }
	   
	}
