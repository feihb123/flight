package hbase;

import java.io.IOException;

import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


public class HFileMapper extends Mapper<LongWritable, Text, ImmutableBytesWritable, Put>{
	@Override
	protected void map(LongWritable key, Text value,
			Mapper<LongWritable, Text, ImmutableBytesWritable, Put>.Context context)
			throws IOException, InterruptedException {
		String line = value.toString();
		String[] strs = line.split(",");
		//指定行键
		String row = strs[0] + strs[7] + strs[8] + strs[4] ;
	
		//创建字节数组  ImmutableBytesWritable 对象,当做行键
		//就是一个byte数组
		//rowKey = row.getBytes();
		ImmutableBytesWritable rowKey = new ImmutableBytesWritable(row.getBytes());
		
		//创建Put对象，用于封装每条数据到HBase中
		Put put = new Put(row.getBytes());
		
		//将strs中的数据封装到Put实例中
		for(int i=0; i<strs.length; i++) {	
			if(i==0||i==1||i==4||i==7||i==8||i==9){
				put.addColumn(TableUtils.family[0], TableUtils.clos[i], 
						Bytes.toBytes(strs[i]));
			}
			if(i==2||i==3||i==5||i==6){
				put.addColumn(TableUtils.family[1], TableUtils.clos[i], 
						Bytes.toBytes(strs[i]));
			}
			if(i>=10){
				put.addColumn(TableUtils.family[2], TableUtils.clos[i], 
						Bytes.toBytes(strs[i]));
			}
		}
			

		//将行键当做key，put对象当做value输出
		context.write(rowKey, put);
	}

}
