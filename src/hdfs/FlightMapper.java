package hdfs;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class FlightMapper extends Mapper<LongWritable, Text, Text, NullWritable>{
	@Override
	protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, NullWritable>.Context context)
			throws IOException, InterruptedException {
		String line=value.toString();
		//跳过第一行
		if(line.startsWith("Year")){
			return;
		}
		String strs[]=line.split(",");
		String newLine="";
		for(int i=0;i<strs.length;i++){
			//分隔数据
			if(i==3||i==4||i==5||i==7||i==11||i==12||i==14||i==17||
					i==18||i==19||i==22||i==23||i==25
					||i==26||i==27||i==28||i==29){
				newLine+=",";
			}
			//过滤数据
			if(i==5||i==7||i==12||i==14||i==15||i==19||i==20||i==23){
				continue;
			}
			//月 日 变为标准格式
			if(i==1||i==2){
				if(strs[i].length()==1){
					newLine+="0"+strs[i];
					continue;
				}
			}
			if("NA".equals(strs[i])){
				newLine+="0";
				continue;
			}
			newLine+=strs[i];			
		}
		System.out.println(newLine);
		context.write(new Text(newLine), NullWritable.get());

	}
}
