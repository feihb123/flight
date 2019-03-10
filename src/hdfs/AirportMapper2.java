package hdfs;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class AirportMapper2 extends Mapper<LongWritable, Text, Text, Text>{
	@Override
	protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, Text>.Context context)
			throws IOException, InterruptedException {
		String line=value.toString();

		String strs[]=line.split("-");
		
		//for(int i=0;i<strs.length;i++){
			//分隔数据

			//if(i==7){
			String origin=strs[0];
				
			//}
			//if(i==8){
			String destination=strs[1];
			//}
			//String trip=origin+"-"+destination;
			System.out.println(origin+"-"+destination);
			context.write(new Text(origin), new Text(destination));			
		//}

	}
}