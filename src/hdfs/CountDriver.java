package hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;


/**
 * 统计航班总数/延误/取消总数
 * @author 化十
 *
 */


public class CountDriver {
	public static void main(String[] args) throws Exception {
		//1.获取配置信息
		Configuration conf=new Configuration();
		//2.创建任务对象
		Job job=Job.getInstance(conf);
		//3.指定mapper组件的相关内容
		job.setMapperClass(CountMapper.class);
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(IntWritable.class);
		
		//4.指定Reducer组件相关内容
		job.setReducerClass(CountReducer.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		
		
		/*FileInputFormat.setInputPaths(job,
				new Path("hdfs://hadoop:9000/mr/wc/in/wordcount"));*/
		//指定输出路径的时候，其实是在指定结果文件存放的目录
		//该目录必须是不存在的
		/*FileOutputFormat.setOutputPath(job, 
				new Path("hdfs://hadoop:9000/mr/wc/in/out"));*/
		
		//5.指定输入输出路径
		FileInputFormat.setInputPaths(job,
				new Path("G:\\Flight\\part-r-00000"));
		FileOutputFormat.setOutputPath(job, 
				new Path("G:\\count"));
		
		//6.提交job任务
		job.waitForCompletion(true);
	}
}
