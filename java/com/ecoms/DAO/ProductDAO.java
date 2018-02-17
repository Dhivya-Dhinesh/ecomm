package com.ecoms.DAO;

import java.util.List;

import com.ecoms.model.Product;

public interface ProductDAO {
	public boolean addProduct(Product product);
	public boolean updateProduct(Product product);
	public boolean deleteProduct(Product product);
	public Product getProduct(int productId);
	public List<Product> retrieveProduct();

}

