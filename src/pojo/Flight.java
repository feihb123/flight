package pojo;

/**
 * 封装全部信息
 * @author 化十
 *
 */
public class Flight {
	private String date;
	private int week;
	private String dep;
	private String arr;
	private String flight;
	private double act;
	private double air;
	private String origin;
	private String dest;
	private Double distance;
	private int cancelled;
	private String code;
	private double carrier;
	private double weather;
	private double NAS;
	private double security;
	private double aircraft;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	public String getFlight() {
		return flight;
	}
	public void setFlight(String flight) {
		this.flight = flight;
	}
	public double getAct() {
		return act;
	}
	public void setAct(double act) {
		this.act = act;
	}
	public double getAir() {
		return air;
	}
	public void setAir(double air) {
		this.air = air;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getDest() {
		return dest;
	}
	public void setDest(String dest) {
		this.dest = dest;
	}
	public Double getDistance() {
		return distance;
	}
	public void setDistance(Double distance) {
		this.distance = distance;
	}
	public int getCancelled() {
		return cancelled;
	}
	public void setCancelled(int cancelled) {
		this.cancelled = cancelled;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getCarrier() {
		return carrier;
	}
	public void setCarrier(double carrier) {
		this.carrier = carrier;
	}
	public double getWeather() {
		return weather;
	}
	public void setWeather(double weather) {
		this.weather = weather;
	}
	public double getNAS() {
		return NAS;
	}
	public void setNAS(double nAS) {
		NAS = nAS;
	}
	public double getSecurity() {
		return security;
	}
	public void setSecurity(double security) {
		this.security = security;
	}
	public double getAircraft() {
		return aircraft;
	}
	public void setAircraft(double aircraft) {
		this.aircraft = aircraft;
	}
	@Override
	public String toString() {
		return "Flight [date=" + date + ", week=" + week + ", dep=" + dep + ", arr=" + arr + ", flight=" + flight
				+ ", act=" + act + ", air=" + air + ", origin=" + origin + ", dest=" + dest + ", distance=" + distance
				+ ", cancelled=" + cancelled + ", code=" + code + ", carrier=" + carrier + ", weather=" + weather
				+ ", NAS=" + NAS + ", security=" + security + ", aircraft=" + aircraft + "]";
	}
	
	
	
}
