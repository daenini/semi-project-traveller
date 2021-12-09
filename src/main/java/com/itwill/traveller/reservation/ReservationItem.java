package com.itwill.traveller.reservation;

import com.itwill.traveller.product.Product;

public class ReservationItem {
	private int ri_no;
	private int ri_qty;
	private int r_no;
	private Product product;
	
	public ReservationItem() {
	}

	public ReservationItem(int ri_no, int ri_qty, int r_no, Product product) {
		super();
		this.ri_no = ri_no;
		this.ri_qty = ri_qty;
		this.r_no = r_no;
		this.product = product;
	}

	public int getRi_no() {
		return ri_no;
	}

	public void setRi_no(int ri_no) {
		this.ri_no = ri_no;
	}

	public int getRi_qty() {
		return ri_qty;
	}

	public void setRi_qty(int ri_qty) {
		this.ri_qty = ri_qty;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "ReservationItem [ri_no=" + ri_no + ", ri_qty=" + ri_qty + ", r_no=" + r_no + ", product=" + product
				+ "]";
	}

	
}
