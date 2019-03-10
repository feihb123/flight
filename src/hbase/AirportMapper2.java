package hbase;

import java.io.IOException;

import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class AirportMapper2 extends Mapper<LongWritable, Text, ImmutableBytesWritable, Put>{
	@Override
	protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, ImmutableBytesWritable, Put>.Context context)
			throws IOException, InterruptedException {
		String line=value.toString();

		String strs[]=line.split("-");

		String row=strs[0].trim();

		String destination=strs[1];
		
		ImmutableBytesWritable rowKey = new ImmutableBytesWritable(row.getBytes());
		//创建Put对象，用于封装每条数据到HBase中
		Put put = new Put(row.getBytes());
		
		//将strs中的数据封装到Put实例中
		put.addColumn(Bytes.toBytes("data"), Bytes.toBytes("destination"), 
				Bytes.toBytes(destination));
			

		context.write(rowKey, put);			
		

	}
}