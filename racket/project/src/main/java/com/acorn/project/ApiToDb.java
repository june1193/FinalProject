package com.acorn.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ApiToDb {
	@Autowired
	DataSource ds;
	
	public int test(){
		Connection con = null;
		PreparedStatement pst=null;
		ResultSet rs = null;
		int check=0;
		try {
			con = ds.getConnection();
			pst = con.prepareStatement("select * from users");
			rs = pst.executeQuery();
			if(rs != null) {
				check=45;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}
}
