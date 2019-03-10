package hbase;

import java.util.List;

import pojo.Flight;

public class Test {
	public static void main(String[] args) {
		
		List<Flight> list=HBaseUtils.getFlight("2008");
		double sum=0,delay=0,cancelled=0;
		for(Flight val:list){
			sum++;
			if((val.getCarrier()+val.getWeather()
			+val.getSecurity()+val.getNAS()+val.getAircraft())>0){
				delay++;
			}
			if(val.getCancelled()==1){
				cancelled++;
			}
		}	
		System.out.println(sum);
		System.out.println(delay);
		System.out.println(cancelled);
		
	}
}
