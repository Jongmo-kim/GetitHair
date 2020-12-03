package image.model.service;

import java.sql.Connection;
import java.util.ArrayList;


import common.JDBCTemplate;
import image.model.dao.ImageDao;
import image.model.vo.Image;

public class ImageService {
	
	public Image selectOneImage(int imgNo) {
		Connection conn = JDBCTemplate.getConnection();
		Image image = new ImageDao().selectOneImage(conn, imgNo);
		JDBCTemplate.close(conn);
		return image;
	}
	
	public ArrayList<Image> selectAllImageByType(String type){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Image> list = new ImageDao().selectAllImageByType(conn,type);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<Image> selectAllImageByTypeAndTypeNo(String type,int typeNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Image> list = new ImageDao().selectAllImageByTypeAndTypeNo(conn,type,typeNo);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public int insertImage(String filepath, String type,int typeNo) {
		//('hairshop','review','style','designer','reserve','designer_portfolio')
		Connection conn = JDBCTemplate.getConnection();
		int result = new ImageDao().insertImage(conn, filepath, type, typeNo);
		if(result > 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public String selectFilepath(String type, int typeNo) {
		Connection conn = JDBCTemplate.getConnection();
		String filepath = new ImageDao().selectFilepath(conn, type, typeNo);
		JDBCTemplate.close(conn);		
		return filepath;
	}
	public Image selectOneImageByTypeAndTypeNo(String type,int typeNo){
		Connection conn = JDBCTemplate.getConnection();
		Image image = new ImageDao().selectOneImageByTypeAndTypeNo(conn,type,typeNo);
		JDBCTemplate.close(conn);
		return image;
	}
}
