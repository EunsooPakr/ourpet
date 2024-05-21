package ourpet.member;

public class Member {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_level;
	private String m_gender;
	private String m_birth;
	private String m_phone;
	private String m_pet;
	private String m_sms_check;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_level() {
		return m_level;
	}
	public void setM_level(String m_level) {
		this.m_level = m_level;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_pet() {
		return m_pet;
	}
	public void setM_pet(String m_pet) {
		this.m_pet = m_pet;
	}
	public String getM_sms_check() {
		return m_sms_check;
	}
	public void setM_sms_check(String m_sms_check) {
		this.m_sms_check = m_sms_check;
	}
	
	@Override
	public String toString()
	{
		return "Member [m_id="+m_id+", m_pw="+m_pw+", m_level="+m_level+
				", m_name="+m_name+", m_gender="+m_gender+", m_birth="+m_birth+","+
				" m_phone="+m_phone+" m_pet="+m_pet+" m_sms_check="+m_sms_check+"\n";
	}
}
