package hbase;

import org.apache.hadoop.hbase.util.Bytes;

public class TableUtils {
	//表名
	public static final String tableName = "flight";
	public static final String airportName = "airport";
	//列族
	public static byte[] air_info = Bytes.toBytes("air_info");
	public static byte[] time_info = Bytes.toBytes("time_info");
	public static byte[] delay_info = Bytes.toBytes("delay_info");
	//字段
	public static final byte[] date = Bytes.toBytes("date");
	public static final byte[] week = Bytes.toBytes("week");
	public static final byte[] dep = Bytes.toBytes("dep");
	public static final byte[] arr = Bytes.toBytes("arr");
	public static final byte[] flight = Bytes.toBytes("flight");
	public static final byte[] act = Bytes.toBytes("act");
	public static final byte[] air = Bytes.toBytes("air");
	public static final byte[] origin = Bytes.toBytes("origin");
	public static final byte[] dest = Bytes.toBytes("dest");
	public static final byte[] distance = Bytes.toBytes("distance");
	public static final byte[] cancelled = Bytes.toBytes("cancelled");
	public static final byte[] code = Bytes.toBytes("code");
	public static final byte[] carrier = Bytes.toBytes("carrier");
	public static final byte[] weather = Bytes.toBytes("weather");
	public static final byte[] NAS = Bytes.toBytes("NAS");
	public static final byte[] security = Bytes.toBytes("security");
	public static final byte[] aircraft = Bytes.toBytes("aircraft");
	
	
	
	
	public static final byte[][] family={
			air_info,time_info,delay_info
		};
	public static final byte[][] clos={
			date,week,dep,arr,flight,act,air,origin,dest,distance,
			cancelled,code,carrier,weather,NAS,security,aircraft
		};
	
	
	
}
