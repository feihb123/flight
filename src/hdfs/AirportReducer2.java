package hdfs;


import java.io.IOException;



import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class AirportReducer2 extends Reducer
				<Text, Text, Text, Text>{
	@Override
	protected void reduce(Text key, Iterable<Text> value,
			Reducer<Text, Text, Text, Text>.Context context) throws IOException, InterruptedException {
		String des="-";
		for(Text origin:value){
			des+=origin.toString()+"/";
		}
		
		context.write(key, new Text(des));
	}
}
