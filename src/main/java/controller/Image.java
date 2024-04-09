package controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Image
{
	public static void main(String[] args) throws IOException 
	{
		File f = new File("C:\\Users\\santh\\eclipse-workspace\\ToDoList\\src\\main\\java\\controller\\img.jpeg");
		
		f.createNewFile();
		
		FileWriter fw = new FileWriter(f);
		
		fw.write("hello");
		fw.flush();
		
	}

}
