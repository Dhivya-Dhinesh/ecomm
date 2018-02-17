package com.ecoms.DAO;

import java.util.List;

import com.ecoms.model.Cart;



public interface CartDAO {
	public boolean addCart(Cart cart);
	public boolean deleteCart(Cart cart);
	public void saveOrUpdate(Cart Cart);
	public Cart getCart(int cartId);
	public List<Cart> retrieveCart();

}
