package com.dao;

import java.sql.Connection;
import com.entity.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class SpecialistDao {

	private Connection conn;

	public SpecialistDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean AddSpecialist(String spec)
	{
		boolean f=false;
		try
		{
			String query="insert into specialist(spec_Name) values(?)";
			PreparedStatement st=conn.prepareStatement(query);
			st.setString(1,spec);
			int i=st.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public List<Specialist> getAllSpecialist()
	{
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s=null;
		try {
			String sql="select*from specialist";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				s=new Specialist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				list.add(s);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
}
