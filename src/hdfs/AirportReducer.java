package hdfs;


import java.io.IOException;


import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class AirportReducer extends Reducer
				<Text, Text, Text, NullWritable>{
	@Override
	protected void reduce(Text key, Iterable<Text> value,
			Reducer<Text, Text, Text, NullWritable>.Context context) throws IOException, InterruptedException {
		/*String des="";
		for(Text origin:value){
			des+=origin.toString()+"/";
		}*/
		
		context.write(key, NullWritable.get());
	}
}
