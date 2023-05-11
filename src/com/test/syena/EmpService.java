package com.test.syena;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.internal.OracleTypes;

public class EmpService {

	String status = "";
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	CallableStatement cs;

	public EmpService() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.230:1521:orcl", "training", "training");
	}

	public String Registration(Emp emp) throws Exception {
		
//		String sql1 = "select * from strutsemp where id = '" + emp.getId() + "'";
//		pst = con.prepareStatement(sql1);
//		rs = pst.executeQuery();
		
		String sql1 = "{call strutsemp_pack.getOne(?,?)}";
		cs = con.prepareCall(sql1);
		cs.setInt(1, emp.getId());
		cs.registerOutParameter(2, OracleTypes.CURSOR);
		cs.execute();
		rs = (ResultSet) cs.getObject(2);
		
		boolean b = rs.next();
		if (b == true) {
			status = "existed";
		} else {
//			 String sql = "insert into strutsemp(id,name,address,salary) values (?,?,?,?)";
			
			String sql = "{call strutsemp_pack.register(?,?,?,?)}";
			pst = con.prepareStatement(sql);

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
		
//		String sql = "select * from strutsemp";
		
		String sql = "{call strutsemp_pack.getAll(?)}";

		cs = con.prepareCall(sql);
		cs.registerOutParameter(1, OracleTypes.CURSOR);
		cs.execute();
		rs = (ResultSet) cs.getObject(1);
		
		while (rs.next()) {
			list.add(new Emp(rs.getInt("id"), rs.getString("name"), rs.getString("address"), rs.getInt("salary")));
		}
		System.out.println(list);
		return list;
	}

	public Emp getDataById(int id) throws Exception {
		Emp emp = new Emp();
		
//		String sql = "select * from strutsemp where id = '" + emp.getId() + "'";
//		pst = con.prepareStatement(sql);
//		rs = pst.executeQuery();
		
		String sql = "{call strutsemp_pack.getOne(?,?)}";
		
		cs = con.prepareCall(sql);
		cs.setInt(1, id);
		cs.registerOutParameter(2, OracleTypes.CURSOR);
		cs.execute();
		rs =(ResultSet) cs.getObject(2);

		if (rs.next()) {
			emp.setId(rs.getInt("id"));
			emp.setName(rs.getString("name"));
			emp.setAddress(rs.getString("address"));
			emp.setSalary(rs.getInt("salary"));
		}

		return emp;
	}

	public String updateEmp(Emp emp) throws Exception {

//		String sql = "update strutsemp set name = ?, address = ?, salary = ? where id = ?";
		String sql = "{call strutsemp_pack.update_emp(?,?,?,?)}";
		
		pst = con.prepareStatement(sql);

		pst.setString(1, emp.getName());
		pst.setString(2, emp.getAddress());
		pst.setInt(3, emp.getSalary());
		pst.setInt(4, emp.getId());

		pst.executeUpdate();

		return "success";
	}

	public boolean deleteEmp(int id) throws Exception {
		
//		String sql = "delete from strutsemp where id = ?";
		String sql = "{call strutsemp_pack.delete_emp(?)}";

		pst = con.prepareStatement(sql);
		pst.setInt(1, id);

		int value = pst.executeUpdate();
		if (value > 0) {
			return true;
		}
		return false;
	}

}
