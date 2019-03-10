package hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;


public class FlightDriver {
	public static void main(String[] args) throws Exception {
		//获取Hadoop配置信息对象
		Configuration conf=new Configuration();
		//创建任务对象
		Job job=Job.getInstance(conf);
		//执行mapper组件的相关内容
		job.setMapperClass(FlightMapper.class);
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(NullWritable.class);
		
	
		
		//指定输入路径、输出路径
		FileInputFormat.setInputPaths(job, new Path("G:\\航班项目\\2008.csv.bz2"));
		//指定输出路径的时候，其实是在指定结果文件存放的目录
		//该目录必须是不存在的
		FileOutputFormat.setOutputPath(job, new Path("G:\\Flight"));
		
		//提交Job任务
		job.waitForCompletion(true);
		
		
	}
}
