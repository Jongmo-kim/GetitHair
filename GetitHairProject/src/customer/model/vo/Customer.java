package customer.model.vo;

import java.io.Serializable;

import org.apache.catalina.util.ToStringUtil;
public class Customer implements Serializable{
	 private static final long serialVersionUID = 1L;
	private String name;
	private int age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Customer(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	public Customer() {
		super();
	}
	@Override
	public String toString() {
		String str = "";
		str += "이름 :" + name + "\n";
		str += "나이 :" + age + "";
		return str;
	}
}
