package lgg.upload.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lgg.datasource.qudong;
import lgg.upload.model.Vodeo;

public class VodeoDao {
	public Boolean inser(Vodeo vodeo) {
		boolean zhuce = false;
		Connection connection = qudong.getConnection();
		PreparedStatement preparedStatement = null;
		String sql = "INSERT INTO video VALUES(?,?,?)";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, vodeo.getYonghu());
			preparedStatement.setString(2, vodeo.getShipinming());
			preparedStatement.setString(3, vodeo.getShijian());
			int n = preparedStatement.executeUpdate();
			if (n > 0)
				zhuce = true;
			qudong.release(connection, preparedStatement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zhuce;
	}
	public Boolean select(String carid) {
		boolean zhuce = false;
		Connection connection = qudong.getConnection();
		PreparedStatement preparedStatement = null;
		String sql = "SELECT * FROM nonghu WHERE shenfengzhengma=?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, carid);
			ResultSet n = preparedStatement.executeQuery();
			if (n!=null)
				zhuce = true;
			qudong.release(connection, preparedStatement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zhuce;
	}

}
