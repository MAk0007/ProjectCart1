package com.itc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.itc.model.Product;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

public class ProductDAOImpl implements ProductDAO {
private JdbcTemplate jdbcTemplate;
	
	public ProductDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean add(Product product) {
		boolean status= false;
		String sql = "INSERT INTO product (id, pname, price, quantity)"
				+ " VALUES (?, ?, ?, ?)";
	try {
		jdbcTemplate.update(sql, product.getId(),product.getPname(),product.getPrice(),product.getQuantity());
		status= true;
		return status;
	} catch (Exception e) {
		
		return status;
	}
		
	}

	@Override
	public boolean update(Product product) {
		boolean status= false;
		String sql = "UPDATE product SET quantity=? WHERE id=?";
	try {
		jdbcTemplate.update(sql,product.getQuantity(),product.getId());
		status= true;
		return status;
	} catch (Exception e) {
		
	
		return status;
	}
		
	}

	@Override
	public boolean delete(int id) {
		boolean status= false;
		String sql = "DELETE FROM product WHERE id=?";
		try {
			jdbcTemplate.update(sql, id);
			status= true;
			return status;
		} catch (Exception e) {
			
			return status;
		}
		
	}

	@Override
	public Product get(int id) {
		String sql = "SELECT * FROM product WHERE id=" + id;
		return jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {

			@Override
			public Product extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				if (rs.next()) {
					Product product = new Product();
					product.setId(rs.getInt("id"));
					product.setPname(rs.getString("pname"));
					product.setPrice(rs.getDouble("price"));;
					product.setQuantity(rs.getInt("quantity"));
					return product;
				}
				
				return null;
			}
			
		});
	}


	@Override
	public List<Product> list() {
		String sql = "SELECT * FROM product";
		List<Product> listProduct = jdbcTemplate.query(sql, new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product aProduct = new Product();
	
			
				aProduct.setId(rs.getInt("id"));
				aProduct.setPname(rs.getString("pname"));
				aProduct.setPrice(rs.getDouble("price"));;
				aProduct.setQuantity(rs.getInt("quantity"));
				return aProduct;
			}
			
		});
		
		return listProduct;
	}
	
	

}
