package hbase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
/*import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.RegexStringComparator;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;*/
import org.apache.hadoop.hbase.util.Bytes;

import pojo.Flight;


public class HBaseUtils {
    static Configuration conf = null;
    static Connection conn = null;
    static TableName tbName = null;
    static TableName airportName = null;
  //用来创建、删除、修改数据表
    static Admin admin = null;
    static Table table = null;
    static Table airportTable = null;
    static {
    	try {
    		conf = HBaseConfiguration.create();
    		conf.set("dfs.replication", "1");
    		conf.set("hbase.zookeeper.quorum", "hadoop");
    		conf.set("dfs.client.use.datanode.hostname", "true");
			conn = ConnectionFactory.createConnection(conf);
			tbName = TableName.valueOf(TableUtils.tableName);
			airportName = TableName.valueOf(TableUtils.airportName);
			admin = conn.getAdmin();
			table = conn.getTable(tbName);
			airportTable = conn.getTable(airportName);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    
    public static List<Flight> getFlight(String rowKey){
    	List<Flight> list = new ArrayList<>();
    	/*Scan scan = new Scan();
    	RegexStringComparator comp = 
    			new RegexStringComparator("^"+day+".*"+place+"$"); 
    	Filter filter = 
    			new RowFilter(
    					CompareFilter.CompareOp.EQUAL, comp);
    	scan.setFilter(filter);

    	System.out.println(scan);*/
    	
    	Scan scan=new Scan(Bytes.toBytes(rowKey+"0"),
    			Bytes.toBytes(rowKey+"Z"));
    	
    	
    	ResultScanner rs = null;
		
		try {
			rs = table.getScanner(scan);
			//遍历结果集，获取每条数据并输出
			for(Result value:rs){
				//获取行键
				/*byte[] row=value.getRow();
				String Key=Bytes.toString(row);
				System.out.println(Key);*/
				byte[] date=value.getValue("air_info".getBytes(), "date".getBytes());
				byte[] week=value.getValue("air_info".getBytes(), "week".getBytes());
				byte[] flight=value.getValue("air_info".getBytes(), "flight".getBytes());
				byte[] origin=value.getValue("air_info".getBytes(), "origin".getBytes());
				byte[] dest=value.getValue("air_info".getBytes(), "dest".getBytes());
				byte[] distance=value.getValue("air_info".getBytes(), "distance".getBytes());
				
				byte[] dep=value.getValue("time_info".getBytes(), "dep".getBytes());
				byte[] arr=value.getValue("time_info".getBytes(), "arr".getBytes());
				byte[] act=value.getValue("time_info".getBytes(), "act".getBytes());
				byte[] air=value.getValue("time_info".getBytes(), "air".getBytes());
				
				byte[] cancelled = value.getValue("delay_info".getBytes(), "cancelled".getBytes());
				byte[] code = value.getValue("delay_info".getBytes(), "code".getBytes());
				byte[] carrier = value.getValue("delay_info".getBytes(), "carrier".getBytes());
				byte[] weather = value.getValue("delay_info".getBytes(), "weather".getBytes());
				byte[] NAS = value.getValue("delay_info".getBytes(), "NAS".getBytes());
				byte[] security = value.getValue("delay_info".getBytes(), "security".getBytes());
				byte[] aircraft = value.getValue("delay_info".getBytes(), "aircraft".getBytes());
				
				Flight val = new Flight();
				val.setDate(Bytes.toString(date));
				val.setWeek(Integer.parseInt(Bytes.toString(week)));
				val.setFlight(Bytes.toString(flight));
				val.setOrigin(Bytes.toString(origin));
				val.setDest(Bytes.toString(dest));
				val.setDistance(Double.parseDouble(Bytes.toString(distance)));
							
				val.setDep(Bytes.toString(dep));
				val.setArr(Bytes.toString(arr));
				val.setAct(Double.parseDouble(Bytes.toString(act)));
				val.setAir(Double.parseDouble(Bytes.toString(air)));
				
				val.setCancelled(Integer.parseInt(Bytes.toString(cancelled)));
				val.setCode(Bytes.toString(code));
				val.setCarrier(Integer.parseInt(Bytes.toString(carrier)));
				val.setWeather(Integer.parseInt(Bytes.toString(weather)));
				val.setNAS(Integer.parseInt(Bytes.toString(NAS)));
				val.setSecurity(Integer.parseInt(Bytes.toString(security)));
				val.setAircraft(Integer.parseInt(Bytes.toString(aircraft)));
				
				list.add(val);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return list;
    }
    
    public static List<String> getAirport(){
    	List<String> list=new ArrayList<>();
    	Scan scan=new Scan();
    	ResultScanner rs = null;
		
		try {
			rs = airportTable.getScanner(scan);
			//遍历结果集，获取每条数据并输出
			for(Result value:rs){
				byte[] row=value.getRow();
				String key=Bytes.toString(row);
				list.add(key);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return list;
    }
    
    public static String getDesAirport(String origin){
    	String destination="";
    	Scan scan=new Scan(Bytes.toBytes(origin));
    	ResultScanner rs = null;
		
		try {
			rs = airportTable.getScanner(scan);
			//遍历结果集，获取每条数据并输出
			for(Result value:rs){
				byte[] des=value.getValue("data".getBytes(), "destination".getBytes());
				//byte[] row=value.getRow();
				destination=Bytes.toString(des);
				break;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return destination;
    }
}