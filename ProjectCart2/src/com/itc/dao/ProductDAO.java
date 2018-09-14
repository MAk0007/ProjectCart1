package com.itc.dao;

import java.util.List;

import com.itc.model.Product;


public interface ProductDAO {
public boolean add(Product product);

public boolean update(Product product);
	
	public boolean delete(int Id);
	
	public Product get(int Id);
	
	public List<Product> list();
}
