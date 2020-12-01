package image.model.service;

import java.sql.Connection;
import java.util.ArrayList;


import common.JDBCTemplate;
import image.model.dao.ImageDao;
import image.model.vo.Image;
import image.model.vo.ImageList;

public class ImageService {
	
	public Image selecteOneImage(int imageNo) {
		Connection conn = JDBCTemplate.getConnection();
		Image image = new ImageDao().selecteOneImage(conn, imageNo);
		JDBCTemplate.close(conn);
		
		return image;
	}
	
	public ArrayList<ImageList> selectAllImageListByType(String type){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ImageList> list = new ImageDao().selectAllImageListByType(conn,type);
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	public ArrayList<ImageList> selectAllImageListByTypeAndTypeNo(String type,int typeNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ImageList> list = new ImageDao().selectAllImageListByTypeAndTypeNo(conn,type,typeNo);
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	public int insertImage(String type,int typeNo,String filename, String filepath) {
		//('hairshop','review','style','designer','reserve','designer_portfolio')
		Connection conn = JDBCTemplate.getConnection();
		int result = new ImageDao().insertImage(conn,filename,filepath);
		result += new ImageDao().insertImageList(conn, type, typeNo);
		if(result > 1)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		
		return result;
	}
}
