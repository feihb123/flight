package hdfs;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class CountMapper extends Mapper<
LongWritable, Text, Text , IntWritable>{
	@Override
	protected void map(LongWritable key, Text value, Mapper<
			LongWritable, Text, Text, IntWritable>.Context context)
			throws IOException, InterruptedException {
		String line=value.toString();
		String[] strs=line.split(",");
		
		context.write(new Text("count"), new IntWritable(1));

		if(Integer.parseInt(strs[10])==1){
			context.write(new Text("cancelled"), new IntWritable(1));
		}
		double delay=Double.parseDouble(strs[12])+
				Double.parseDouble(strs[13])+
				Double.parseDouble(strs[14])+
				Double.parseDouble(strs[15])+
				Double.parseDouble(strs[16]);
		
		if(delay>0){
			context.write(new Text("delay"), new IntWritable(1));
		}

	}
}
