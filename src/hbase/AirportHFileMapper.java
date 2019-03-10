package hbase;

import java.io.IOException;

import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


public class AirportHFileMapper extends Mapper<LongWritable, Text, ImmutableBytesWritable, Put>{
	@Override
	protected void map(LongWritable key, Text value,
			Mapper<LongWritable, Text, ImmutableBytesWritable, Put>.Context context)
			throws IOException, InterruptedException {
		String line = value.toString();
		//指定行键
		String row = line.trim() ;
	
		//创建字节数组  ImmutableBytesWritable 对象,当做行键
		//就是一个byte数组
		//rowKey = row.getBytes();
		ImmutableBytesWritable rowKey = new ImmutableBytesWritable(row.getBytes());
		
		//创建Put对象，用于封装每条数据到HBase中
		Put put = new Put(row.getBytes());
		
		//将strs中的数据封装到Put实例中
		put.addColumn(Bytes.toBytes("data"), Bytes.toBytes("name"), 
				Bytes.toBytes(row));
			

		//将行键当做key，put对象当做value输出
		context.write(rowKey, put);
	}

}
