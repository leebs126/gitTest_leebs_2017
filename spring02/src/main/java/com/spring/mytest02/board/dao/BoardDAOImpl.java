package com.spring.mytest02.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.mytest02.board.dto.BoardDTO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	SqlSession sqlSession;
	//public ArrayList listBoard() throws DataAccessException{
	public ArrayList listBoard(String publicWrite) throws DataAccessException{
		ArrayList boardList=(ArrayList)sqlSession.selectList("mapper.board.listBoard",publicWrite);
		return boardList;
	}
	
	public BoardDTO writeDetail(int num) throws DataAccessException{
		BoardDTO dto=(BoardDTO)sqlSession.selectOne("mapper.board.writeDetail",num);
		return dto;
	}
	public void addWrite(HashMap writeMap) throws DataAccessException{
		sqlSession.insert("mapper.board.addWrite",writeMap);
	}
    public void addImageFile(ArrayList fileList,int num) throws DataAccessException{
    	HashMap imageMap=new HashMap();
    	imageMap.put("num",num);
    	for(int i=0;i<fileList.size();i++){
    		String imageFileName=(String)fileList.get(i);
    		imageMap.put("imageFileName",imageFileName);
    		sqlSession.insert("mapper.board.addImageFile",imageMap);
    	}
	}
	public int getPrimaryKey() throws DataAccessException{
		int num=sqlSession.selectOne("mapper.board.getPrimarykey");
		return num;
	}
	public void modWrite(HashMap writeMap) throws DataAccessException{
		sqlSession.update("mapper.board.modWrite",writeMap);
	}
	public void delWrite(int num) throws DataAccessException{
		sqlSession.delete("mapper.board.delWrite",num);
	}
	public ArrayList  listImageFile(int num) throws DataAccessException{
		return (ArrayList)sqlSession.selectList("mapper.board.listImageFile",num);
	}
	
}
