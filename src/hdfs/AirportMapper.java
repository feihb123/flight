package hdfs;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class AirportMapper extends Mapper<LongWritable, Text, Text, NullWritable>{
	@Override
	protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, NullWritable>.Context context)
			throws IOException, InterruptedException {
		String line=value.toString();
		//跳过第一行
		if(line.startsWith("Year")){
			return;
		}
		String strs[]=line.split(",");
		
		//for(int i=0;i<strs.length;i++){
			//分隔数据

			//if(i==7){
			String origin=strs[7];
				
			//}
			//if(i==8){
			String destination=strs[8];
			//}
			String trip=origin+"-"+destination;
			System.out.println(origin+"-"+destination);
			context.write(new Text(trip), NullWritable.get());			
		//}

	}
}