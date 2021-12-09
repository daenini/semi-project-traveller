package com.itwill.traveller.product.test;

import com.itwill.traveller.product.Product;
import com.itwill.traveller.product.ProductDao;
import com.itwill.traveller.product.ProductService;

public class ProductDaoTestMain {

	public static void main(String[] args) throws Exception{
		ProductService productService = new ProductService();
		/*
		System.out.println(productService.getProductsList());
		System.out.println(productService.getProduct(1));
		System.out.println(productService.getCategoryProduct("제주도"));
		System.out.println(productService.getOrderGrade());
		System.out.println(productService.getOrderCategory("서울"));

		Product updateP = productService.getProduct(19);
		updateP.setP_name("Test이름 변경!");
		System.out.println(productService.updateProduct(updateP));
		System.out.println(productService.deleteProduct(26));
*/
		System.out.println(productService.insertProduct(
				new Product(0,"test",1000,null,0,null,null,null,0)));
	
	}

}
