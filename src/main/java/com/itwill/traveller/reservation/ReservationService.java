package com.itwill.traveller.reservation;

import java.util.ArrayList;

import com.itwill.traveller.cart.Cart;
import com.itwill.traveller.cart.CartDao;
import com.itwill.traveller.product.Product;
import com.itwill.traveller.product.ProductDao;

public class ReservationService {
	private ReservationDao reservationDao;
	private CartDao cartDao;
	private ProductDao productDao;
	
	
	public ReservationService() throws Exception {
		this.reservationDao = new ReservationDao();
		this.cartDao = new CartDao();
		this.productDao = new ProductDao();
	}
	/*
	public ReservationItem getReservationItem(int no) throws Exception{
		return reservationDao.getReservationItem(no);
	}
	*/
	public ArrayList<Reservation> viewAll(String sUserId) throws Exception{
		return reservationDao.viewAll(sUserId);
	}

	public Reservation view(String sUserId, int r_no) throws Exception{
		return reservationDao.view(sUserId, r_no);
	}
	
	
	public void insertReservation(String sUserId, String method, String[] c_item_no) throws Exception{
		ArrayList<Cart> cartList=cartDao.selectById(sUserId);
		ArrayList<ReservationItem> reservationsItemList = new ArrayList<ReservationItem>();
		int totPrice = 0;
		int totQty = 0;
		for(int i =0;i<c_item_no.length;i++) {
			Cart cart = cartDao.getProductByCno(Integer.parseInt(c_item_no[i])); 
			ReservationItem reservationItem = new ReservationItem(0, cart.getC_qty(), 0, cart.getProduct());
			reservationsItemList.add(reservationItem);
			totPrice += reservationItem.getProduct().getP_price()*reservationItem.getRi_qty();
			totQty += reservationItem.getRi_qty();
		}
		String r_desc = reservationsItemList.get(0).getProduct().getP_name()+"외 "+(totQty-1)+"개";
		reservationDao.insertReservation(new Reservation(0,r_desc,null,method,totPrice,sUserId,reservationsItemList));
		cartDao.deleteAll(sUserId);
	}
	
}
