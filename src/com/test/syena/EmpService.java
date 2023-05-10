package com.test.syena;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpService {

	String status = "";
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	public EmpService() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.230:1521:orcl", "training", "training");
	}

	public String Registration(Emp emp) throws Exception {

		pst = con.prepareStatement("select * from strutsemp where id = '" + emp.getId() + "'");
		rs = pst.executeQuery();
		if (rs.next()) {
			status = "existed";
		} else {
			pst = con.prepareStatement("insert into strutsemp(id,name,address,salary) values (?,?,?,?)");

			pst.setInt(1, emp.getId());
			pst.setString(2, emp.getName());
			pst.setString(3, emp.getAddress());
			pst.setInt(4, emp.getSalary());

			pst.executeUpdate();
			status = "success";
		}
		return status;
	}

	public List<Emp> getAllData() throws SQLException {
		List<Emp> list = new ArrayList<Emp>();

		pst = con.prepareStatement("select * from strutsemp");
		rs = pst.executeQuery();
		while (rs.next()) {
			list.add(new Emp(rs.getInt("id"), rs.getString("name"), rs.getString("address"), rs.getInt("salary")));
		}
		System.out.println(list);
		return list;
	}

	public Emp getDataById(int id) throws Exception {
		Emp emp = new Emp();
		pst = con.prepareStatement("select * from strutsemp where id = '" + emp.getId() + "'");
		rs = pst.executeQuery();

		if (rs.next()) {
			emp.setId(rs.getInt("id"));
			emp.setName(rs.getString("name"));
			emp.setAddress(rs.getString("address"));
			emp.setSalary(rs.getInt("salary"));
		}

		return emp;
	}

	public String updateEmp(Emp emp) throws Exception {

		pst = con.prepareStatement("update strutsemp set name = ?, address = ?, salary = ? where id = ?");

		pst.setString(1, emp.getName());
		pst.setString(2, emp.getAddress());
		pst.setInt(3, emp.getSalary());
		pst.setInt(4, emp.getId());

		pst.executeUpdate();

		return "success";
	}

	public boolean deleteEmp(int id) throws Exception {

		pst = con.prepareStatement("delete from strutsemp where id = ?");
		pst.setInt(1, id);

		int value = pst.executeUpdate();
		if (value > 0) {
			return true;
		}
		return false;
	}

}
