package lgg.upload.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import lgg.datasource.qudong;

public class OpenShopDao {
	public int updateUserTable(List<String> list,String username) throws SQLException {
		Connection connection = qudong.getConnection();
		PreparedStatement preparedStatement = null;
		String sql = "UPDATE yonghui SET category=1 WHERE yonghuiming=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, username);
		int n = preparedStatement.executeUpdate();
		String sql1 = "INSERT INTO nonghu VALUES(?,?,?,?,?,'null',NOW())";
		preparedStatement = connection.prepareStatement(sql1);
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, username);
		preparedStatement.setString(3, list.get(1));
		preparedStatement.setString(4, list.get(0));
		preparedStatement.setString(5, list.get(2));
		int m = preparedStatement.executeUpdate();
		qudong.release(connection, preparedStatement);
		if(n>0&&m>0)
			return 1;
		return 0;
	}

}
