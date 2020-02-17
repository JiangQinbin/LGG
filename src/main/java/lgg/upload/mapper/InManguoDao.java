package lgg.upload.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import lgg.datasource.qudong;
import lgg.upload.model.MangoPrice;

public class InManguoDao {
	public boolean inser(MangoPrice data)
	/*     */   {
	/*  19 */    boolean zhuce = false;
	/* 18 */     Connection connection = qudong.getConnection();
	/* 19 */     PreparedStatement preparedStatement = null;
	/* 20 */     String sql = "INSERT INTO mangoattribute VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	/*    */     try {
	/* 22 */       preparedStatement = connection.prepareStatement(sql);
	/* 23 */       preparedStatement.setString(2, data.getManguoname());
	/* 24 */       preparedStatement.setFloat(3, data.getDanjiadahao());
	/* 26 */       preparedStatement.setFloat(5, data.getDanjiaxiaohao());
	/* 27 */       preparedStatement.setFloat(4, data.getDanjiadazhong());
	               preparedStatement.setFloat(6, data.getDanjiaziaozhong());
	/* 27 */       preparedStatement.setFloat(7, data.getDapingjun());
	               preparedStatement.setFloat(8, data.getXiaopingjun());
	/* 27 */       preparedStatement.setString(9, data.getUsername());
	               preparedStatement.setString(10, data.getIntroduce());
	               preparedStatement.setString(1, data.getManguoID());
	               preparedStatement.setInt(11, data.getKeshouliang());
	               preparedStatement.setInt(12, data.getYeshouliang());
	/* 28 */       int n = preparedStatement.executeUpdate();
	/* 29 */       if (n > 0)
	/* 30 */         zhuce = true;
	/* 31 */       qudong.release(connection, preparedStatement);
	/*    */     }
	/*    */     catch (SQLException e) {
	/* 34 */       e.printStackTrace();
	/*    */     }
	/*    */     
	/* 37 */     return zhuce;
	/*     */   }

}
