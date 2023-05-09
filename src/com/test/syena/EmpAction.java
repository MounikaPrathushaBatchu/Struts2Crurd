package com.test.syena;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EmpAction extends ActionSupport {

	Emp emp = new Emp();
	List<Emp> list = new ArrayList<Emp>();

	public List<Emp> getList() {
		return list;
	}
	public void setList(List<Emp> list) {
		this.list = list;
	}
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public String register() throws Exception {
		String status = "";

		EmpService ec = new EmpService();
		status = ec.Registration(emp);

		return status;
	}
	
	public String update() throws Exception {
		
		EmpService ec = new EmpService();
		ec.updateEmp(emp);
		
		return "success";
	}

	public String getAll() throws Exception {

		EmpService ec = new EmpService();
		list = ec.getAllData();

		return "success";
	}
	
	public String edit() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		int id = Integer.parseInt(request.getParameter("id"));
		
		EmpService ec = new EmpService();
		Emp e = ec.getDataById(id);
		
		emp.setId(e.getId());
		emp.setName(e.getName());
		emp.setAddress(e.getAddress());
		emp.setSalary(e.getSalary());
		
		return "success";
	}
	public String delete() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		int id = Integer.parseInt(request.getParameter("id"));
		
		EmpService ec = new EmpService();
		boolean status = ec.deleteEmp(id);
		
		if(status) {
			getAll();
			return "success";
		} else {
			return "failure";
		}
		
	}
}
